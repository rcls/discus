module discus(input wire clk,
              input wire snoop_clk,
              input wire [7:0] snoopa,
              input wire [7:0] snoopd,
              output reg [7:0] snoopq,
              input wire snoopm,
              input wire snoopp);

   reg [7:0] memory[255:0];
   reg [7:0] prgram[255:0];

   always@(posedge snoop_clk) begin : snoop
      if (snoopm)
        memory[snoopa] <= snoopd;

      if (snoopp)
        prgram[snoopa[7:0]] <= snoopd;

      snoopq <= memory[snoopa];
   end

   // Pipeline stages:
   // Instruction fetch.
   // Instruction decode.
   // Execute.
   // Commit.
   //
   // Instructions looking up memory do two cycles in Execute.
   // Commit saves Z and result.  (Execute writes C).
   // Z has fast-forward to jump in decode.
   // Result and mem-load have fast-forward to execute.

   // PC is the fetch PC.  During decode is PC+1.
   // SP and the stack is updated by decode.
   // Cflag is updated by exec.
   // regs & Zflag is updated by commit.
   reg [7:0] decode_PC;
   reg [7:0] A;
   reg       Cflag;
   reg       Zflag;
   reg [7:0] regs[3:0];
   reg [7:0] stack[3:0];

   reg [7:0] fetch_instruction;
   reg fetch_prev_was_data;
   reg fetch_post_mem_read;

   // XST is too clever and removes one of the low bits...
   (* KEEP = "true" *)
   reg [1:0] decode_rdSP = 2'b00;
   (* KEEP = "true" *)
   reg [1:0] decode_wrSP = 2'b11;

   // Instruction in decode; downstream uses the decoded flags.
   (* KEEP = "true" *)
   reg [7:0] decode_instruction;

   // For instruction decode only.
   reg decode_is_ret;
   reg decode_is_call;
   reg [2:0] decode_condition;
   reg decode_branch_stall;
   reg [5:0] decode_prev_data;
   reg decode_prev_was_data;
   wire decode_mem_read = fetch_post_mem_read;
   reg decode_alu;                      // ALU step of load+op

   // For exec.
   reg [7:0] exec_constant;
   reg [7:0] exec_memB;
   reg [1:0] exec_reg_to_write;
   reg [1:0] exec_reg_to_read;
   reg exec_reg_read;
   reg exec_reg_ff;
   reg exec_use_C;
   reg exec_reg_write;
   reg exec_C_write;
   reg exec_Z_write;
   reg exec_mem_read;
   reg exec_mem_write;
   reg [2:0] exec_op;

   // For commit.
   reg commit_Z_write;
   reg commit_reg_write;
   reg [1:0] commit_reg_to_write;
   reg [7:0] Q;

   localparam Bpass   = 0;
   localparam AandB   = 1;
   localparam AorB    = 2;
   localparam AxorB   = 3;
   localparam AplusB  = 4;
   localparam AminusB = 5;
   localparam Bplus1  = 6;
   localparam Bminus1 = 7;

   always@(posedge clk) begin : fetch
      reg [7:0] branch_target;
      reg ZflagEff;
      reg condition;
      reg decode_take_branch;
      reg [7:0] fetch_PC;
      reg [2:0] ZflagEff_Adder;
      reg fetch_needs_memory;
      reg fetch_mem_read;

      decode_condition <= fetch_instruction[4:2];
      decode_is_call <= 0;
      decode_is_ret <= 0;
      if (fetch_instruction[7:5] == 3'b00 && fetch_prev_was_data)
        decode_is_call <= fetch_instruction[5];
      else if (fetch_instruction[7:5] == 3'b101)
        decode_is_ret <= 1;
      else
        decode_condition <= 0;          // Not a branch.

      ZflagEff_Adder = { 1'b0, |Q[7:4], |Q[3:0] };
      ZflagEff_Adder = ZflagEff_Adder
                       + { !commit_Z_write && !Zflag, commit_Z_write, commit_Z_write };
      ZflagEff = ZflagEff_Adder[2];

      case (decode_condition)
        3'b000, 3'b010: decode_take_branch = 0;
        3'b001, 3'b011: decode_take_branch = 1;
        3'b100: decode_take_branch = ZflagEff;
        3'b101: decode_take_branch = !ZflagEff;
        3'b110: decode_take_branch = Cflag;
        3'b111: decode_take_branch = !Cflag;
      endcase;

      if (decode_is_ret)
        branch_target = stack[decode_rdSP];
      else
        branch_target = { decode_prev_data, decode_instruction[1:0] };

      if (decode_take_branch) begin
         if (decode_is_call) begin
            stack[decode_wrSP] <= decode_PC;
            decode_rdSP <= decode_rdSP - 1;
            decode_wrSP <= decode_rdSP - 2;
         end
         else if (decode_is_ret) begin
            decode_rdSP <= decode_rdSP + 1;
            decode_wrSP <= decode_rdSP;
         end
      end

      decode_instruction <= fetch_instruction;

      if (!fetch_prev_was_data && fetch_instruction[7:6] == 2'b00)
        fetch_prev_was_data <= 1;
      else
        fetch_prev_was_data <= 0;

      decode_prev_was_data <= fetch_prev_was_data;

      // Work out if this instruction really does read memory.
      fetch_needs_memory = !fetch_instruction[1] && fetch_instruction[2];
      if (fetch_instruction[7:6] == 2'b00
          || fetch_instruction[7:5] == 3'b101)
        fetch_needs_memory = 0;
      else
        fetch_needs_memory = fetch_instruction[2];

      fetch_mem_read = fetch_needs_memory && !fetch_post_mem_read;
      fetch_post_mem_read <= fetch_mem_read;

      // Do two cycles for ALU instructions that read memory.
      decode_alu <= !fetch_needs_memory || fetch_post_mem_read;

      if (decode_take_branch)
        fetch_PC = branch_target;
      else
        fetch_PC = decode_PC + !fetch_post_mem_read;
      decode_PC <= fetch_PC;

      // When fetch_mem_read is set, we want to keep the current instruction.
      // [Or we could just not advance the PC on fetch_mem_read.]
      if (!fetch_mem_read)
        fetch_instruction <= prgram[fetch_PC];

      // If we took a branch then the currently fetched instruction is bogus.
      // fetch discards what is has just done; decode will stall.
      decode_branch_stall <= decode_take_branch;
      if (decode_take_branch) begin
         fetch_prev_was_data <= 0;
         fetch_post_mem_read <= 0;
         decode_condition <= 0;
         decode_is_call <= 0;
         decode_is_ret <= 0;
      end
   end

   always@(posedge clk) begin : decode
      decode_prev_data <= decode_instruction[5:0];

      if (decode_instruction[7])
        exec_reg_to_write <= decode_instruction[4:3]; // Load / inc /dec.
      else
        exec_reg_to_write <= 2'b00;     // ALU.

      if (decode_instruction[7:6] != 2'b00
          && decode_instruction[7:3] != 5'b01111
          && decode_instruction[7:5] != 3'b101)
        exec_reg_write <= decode_alu;
      else
        exec_reg_write <= 0;

      if (decode_instruction[7:2] == 6'b101001)
        exec_mem_write <= 1;
      else
        exec_mem_write <= 0;

      // Arith operation...
      if (decode_instruction[7:4] == 5'b0100)
        exec_op <= AplusB;
      else if (decode_instruction[7:4] == 5'b0101)
        exec_op <= AminusB;
      else if (decode_instruction[7:3] == 5'b01100)
        exec_op <= AorB;
      else if (decode_instruction[7:3] == 5'b01101)
        exec_op <= AxorB;
      else if (decode_instruction[7:3] == 5'b01110)
        exec_op <= AandB;
      else if (decode_instruction[7:3] == 5'b01111)
        exec_op <= AminusB;
      else if (decode_instruction[7:5] == 3'b110)
        exec_op <= Bminus1;
      else if (decode_instruction[7:5] == 3'b111)
        exec_op <= Bplus1;
      else
        exec_op <= Bpass;

      exec_use_C <= (decode_instruction[7:3] == 5'b01001 || decode_instruction[7:3] == 5'b01011);

      // Work out the source of the 'B' input to the ALU.  If can be any of:
      // Constant.
      // Memory read.
      // Register read (normal).
      // Register read (ff).
      // For post-mem-read or using a constant, set exec_reg_read=0 and
      // reg_to_read=0.  The values are OR'd in.
      if (exec_mem_read || decode_prev_was_data) begin
         exec_reg_to_read <= 2'bXX;
         exec_reg_read <= 0;
         exec_reg_ff <= 1'bX;
      end
      // For register fast-forward, set exec_reg_read=0 and reg_to_read=1.
      else if (exec_reg_to_write == decode_instruction[1:0]) begin
         exec_reg_to_read <= 2'bXX;
         exec_reg_read <= 1;
         exec_reg_ff <= 1;
      end
      else begin
         exec_reg_to_read <= decode_instruction[1:0];
         exec_reg_read <= 1;
         exec_reg_ff <= 0;
      end

      if (decode_prev_was_data)
        exec_constant <= { decode_prev_data, decode_instruction[1:0] };
      else
        exec_constant <= 0;

      exec_mem_read <= decode_mem_read;
      exec_Z_write <= decode_instruction[6] && decode_alu;
      exec_C_write <= (decode_instruction[7:6] == 2'b01) && decode_alu;

      if (decode_branch_stall) begin
         exec_Z_write <= 0;
         exec_C_write <= 0;
         exec_reg_write <= 0;
         exec_mem_write <= 0;
      end
   end

   always@(posedge clk) begin : exec
      reg [7:0] effA;
      reg [7:0] effB;
      reg [9:0] logicA;
      reg [9:0] logicB;
      reg [10:0] sum;

      if (commit_reg_write && commit_reg_to_write == 0)
        effA = Q;
      else
        effA = A;

      if (!exec_reg_read)
        effB = exec_constant;
      else if (exec_reg_ff)
        effB = Q;
      else
        effB = regs[exec_reg_to_read];

      if (exec_mem_read)
        exec_memB <= memory[effB];
      else
        exec_memB <= 0;

      case (exec_op)
        Bpass:   logicA = { 1'b0, effB | exec_memB,          1'b0 };
        AandB:   logicA = { 1'b1, effA & (effB | exec_memB), 1'b0 };
        AorB:    logicA = { 1'b0, effA | effB | exec_memB,   1'b0 };
        AxorB:   logicA = { 1'b0, effA ^ (effB | exec_memB), 1'b0 };
        AplusB:  logicA = { 1'b0, effA,                    Cflag & exec_use_C };
        AminusB: logicA = { 1'b0, effA,                   Cflag | !exec_use_C };
        Bplus1:  logicA = 10'b0000000010;
        Bminus1: logicA = 10'b0111111110;
      endcase
      case (exec_op)
        Bpass:   logicB = 0;
        AandB:   logicB = 10'b1000000000;
        AorB:    logicB = 0;
        AxorB:   logicB = 0;
        AplusB:  logicB = { 1'b1,  effB |  exec_memB, 1'b1 };
        AminusB: logicB = { 1'b1, ~effB & ~exec_memB, 1'b1 };
        Bplus1:  logicB = { 1'b1,  effB |  exec_memB, 1'b0 };
        Bminus1: logicB = { 1'b1,  effB |  exec_memB, 1'b0 };
      endcase

      // If we are not writing C, then overwrite logicA/B[9] to force preserving
      // the previous value.
      if (!exec_C_write) begin
         logicA[9] = Cflag;
         logicB[9] = Cflag;
      end;

      sum = logicA + logicB;
      Q <= sum[8:1];
      Cflag <= sum[10];

      if (exec_mem_write)
        memory[effB] <= effA;
   end

   always@(posedge clk) begin : commit
      commit_reg_write <= exec_reg_write;
      commit_reg_to_write <= exec_reg_to_write;
      commit_Z_write <= exec_Z_write;

      if (commit_reg_write)
        regs[commit_reg_to_write] <= Q;

      if (commit_reg_write && commit_reg_to_write == 0)
        A <= Q;

      if (commit_Z_write)
        Zflag <= (Q == 0);
   end
endmodule
