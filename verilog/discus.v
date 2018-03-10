module discus(input wire clk,
              input wire reset,
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

   // Buffer the reset line a bit.
   reg reset_input;
   always@(posedge clk) begin : reset_buffer
      reg reset_io;
      reset_io <= reset;
      reset_input <= reset_io;
   end

   // Pipeline stages:
   // Instruction fetch.
   // Instruction decode.
   // Execute.
   // Commit.
   //
   // Instructions looking up memory do two cycles in Execute.
   // Commit saves Z and result.  (Execute writes C).
   // Z has fast-forward  processing in decode.
   // Results of previous instructions have a fast-forward path into execute.

   // decode_PC is 1+ the address of the instruction in decode.
   // SP and the stack is updated by decode.
   // Cflag is updated by exec.
   // regs & Zflag is updated by commit.
   reg [7:0] decode_PC = 0;
   reg [7:0] A = 0;
   reg       Cflag = 0;
   reg       Zflag = 0;
   reg [7:0] regs[0:3];
   reg [7:0] stack[0:3];

   reg [7:0] fetch_instruction = 0;
   reg fetch_prev_was_data = 0;
   reg fetch_post_mem_read = 0;
   reg fetch_reset = 0;

   reg [1:0] SP = 0;
   reg [1:0] SP_index = 0;

   // Instruction in decode; downstream uses the decoded flags.
   reg [7:0] decode_instruction = 3'b1;

   // For instruction decode only.
   reg [2:0] decode_condition = 0;
   reg decode_branch_stall = 0;
   reg [5:0] decode_prev_data = 0;
   reg decode_prev_was_data = 0;
   wire decode_mem_read = fetch_post_mem_read;
   reg decode_alu = 0;                  // ALU step of load+op

   // For exec.
   reg [7:0] exec_constant = 0;
   reg [7:0] exec_memB = 0;
   reg [1:0] exec_reg_to_write = 0;
   reg [1:0] exec_reg_to_read = 0;
   reg exec_reg_read = 0;
   reg exec_reg_ff = 0;
   reg exec_use_C = 0;
   reg exec_reg_write = 0;
   reg exec_C_write = 0;
   reg exec_Z_write = 0;
   reg exec_mem_read = 0;
   reg exec_mem_write = 0;
   reg [2:0] exec_op = 0;

   // For commit.
   reg commit_Z_write = 0;
   reg commit_reg_write = 0;
   reg [1:0] commit_reg_to_write = 0;
   reg [7:0] Q = 0;

   localparam Bpass   = 0;
   localparam AandB   = 1;
   localparam AorB    = 2;
   localparam AxorB   = 3;
   localparam AplusB  = 4;
   localparam AminusB = 5;
   localparam Bplus1  = 6;
   localparam Bminus1 = 7;

   initial begin : zero
      integer i;
      for (i = 0; i < 256; i = i + 1) begin
         memory[i] = 0;
         prgram[i] = 0;
      end

      regs[0] = 0;
      regs[1] = 0;
      regs[2] = 0;
      regs[3] = 0;
      stack[0] = 0;
      stack[1] = 0;
      stack[2] = 0;
      stack[3] = 0;
   end

   always@(posedge clk) begin : fetch
      reg [7:0] decode_branch_target;
      reg condition;
      reg decode_take_branch;
      reg [7:0] fetch_PC;
      reg fetch_needs_memory;
      reg fetch_mem_read;

      if (fetch_instruction[7:5] == 3'b00 && fetch_prev_was_data)
        decode_condition <= fetch_instruction[4:2];
      else if (fetch_instruction[7:5] == 3'b101)
        decode_condition <= fetch_instruction[4:2];
      else
        decode_condition <= 3'b001;

      // We can only update the SP every other clock cycle, so we can process
      // the SP both in fetch & decode.
      if (fetch_instruction[7])
        SP_index <= SP;
      else
        SP_index <= SP - 1;

      begin : decode_branch_evaluate
         // The carry into the last stage is !Z or !C or 0, which we then
         // invert if decode_condition[0]==0.
         reg [3:0] take_branch_addendA;
         reg [3:0] take_branch_addendB;
         reg [3:0] take_branch_sum;
         take_branch_addendA[0] = |Q[3:0];
         take_branch_addendB[0] = 1;
         take_branch_addendA[1] = |Q[7:4];
         take_branch_addendB[1] = 1;

         case (decode_condition[2:1])
           2'b00, 2'b01: take_branch_addendA[2] = 0;
           2'b10: take_branch_addendA[2] = !Zflag | commit_Z_write;
           2'b11: take_branch_addendA[2] = !Cflag;
         endcase
         case (decode_condition[2:1])
           2'b00, 2'b01: take_branch_addendB[2] = 0;
           2'b10: take_branch_addendB[2] = !Zflag & !commit_Z_write;
           2'b11: take_branch_addendB[2] = !Cflag;
         endcase
         take_branch_addendA[3] = 0;
         take_branch_addendB[3] = !decode_condition[0];
         take_branch_sum = take_branch_addendA + take_branch_addendB;
         decode_take_branch = take_branch_sum[3];
      end

      if (decode_instruction[7])
        decode_branch_target = stack[SP_index];
      else
        // fetch_prev_data = decode_instruction[5:0].
        decode_branch_target = { decode_instruction[1:0], decode_prev_data[5:0] };

      if (!decode_take_branch)
        SP <= SP;
      else if (decode_instruction[7])
        SP <= SP + 1;              // For returns.
      else if (decode_instruction[5])
        SP <= SP;                  // Jumps.
      else
        SP <= SP - 1;              // For calls.

      // If we are taking a 'call' then write the stack.
      if (decode_take_branch && !decode_instruction[7] && !decode_instruction[5])
        stack[SP_index] <= decode_PC;

      decode_instruction <= fetch_instruction;

      if (!fetch_prev_was_data && fetch_instruction[7:6] == 2'b00)
        fetch_prev_was_data <= 1;
      else
        fetch_prev_was_data <= 0;

      decode_prev_was_data <= fetch_prev_was_data;

      // Work out if this instruction really does read memory.
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
        fetch_PC = decode_branch_target;
      else
        fetch_PC = decode_PC + !fetch_post_mem_read;
      decode_PC <= fetch_PC;

      // When fetch_mem_read is set, we want to keep the current instruction.
      // [Or we could just not advance the PC on fetch_mem_read.]
      if (fetch_reset)
        fetch_instruction <= 0;
      else if (!fetch_mem_read)
        fetch_instruction <= prgram[fetch_PC];

      if (reset_input)
        fetch_reset <= 1;
      else if (fetch_prev_was_data)
        fetch_reset <= 0;

      // If we took a branch then the currently fetched instruction is bogus.
      // fetch discards what it has just done; decode will stall.
      decode_branch_stall <= decode_take_branch;
      if (decode_take_branch) begin
         fetch_prev_was_data <= 0;
         fetch_post_mem_read <= 0;
         decode_condition <= 3'b001;
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
        exec_op <= Bplus1;
      else if (decode_instruction[7:5] == 3'b111)
        exec_op <= Bminus1;
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
      else if (exec_reg_write
               && exec_reg_to_write == decode_instruction[1:0]) begin
         exec_reg_to_read <= 2'bXX;
         exec_reg_read <= 1;
         exec_reg_ff <= 1;
      end
      else begin
         exec_reg_to_read <= decode_instruction[1:0];
         exec_reg_read <= 1;
         exec_reg_ff <= 0;
      end

      if (decode_prev_was_data && !exec_mem_read)
        exec_constant <= { decode_instruction[1:0], decode_prev_data };
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
