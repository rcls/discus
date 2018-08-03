module discus(input wire clk,
              input wire reset,
              output wire memory_read,
              output wire memory_write,
              output wire [7:0] memory_address,
              output wire [7:0] memory_D,
              input wire [7:0] memory_Q,
              output bit [7:0] fetch_PC,
              output bit fetch_reset,
              input wire [7:0] fetch_instruction);

   // Buffer the reset line a bit.
   bit reset_input = 1;
   always@(posedge clk) begin : reset_buffer
      bit reset_io;
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
   bit [7:0] decode_PC;
   bit [7:0] A;
   bit       Cflag;
   bit       Zflag;
   bit [7:0] regs[0:3];
   bit [7:0] stack[0:3];

   bit fetch_prev_was_data;

   bit [1:0] SP;
   bit [7:0] return_PC;

   // Instruction in decode; downstream uses the decoded flags.
   bit [7:0] decode_instruction = 8'h80;

   // For instruction decode only.
   bit decode_is_branch;
   bit [5:0] decode_prev_data;
   bit decode_prev_was_data;
   bit decode_not_mem_read = 1;

   // For exec.
   bit [7:0] exec_constant;
   wire [7:0] exec_memB;
   bit [1:0] exec_reg_to_write;
   bit [1:0] exec_reg_to_read;
   bit exec_reg_read;
   bit exec_reg_ff;
   bit exec_use_C;
   bit exec_reg_write;
   bit exec_C_write;
   bit exec_Z_write;
   bit exec_mem_read;
   bit exec_mem_write;
   bit [2:0] exec_op;

   // For commit.
   bit commit_Z_write;
   bit commit_reg_write;
   bit commit_reg_write_A;
   bit [1:0] commit_reg_to_write;
   bit [7:0] Q;

   localparam Bpass   = 0;
   localparam AandB   = 1;
   localparam AorB    = 2;
   localparam AxorB   = 3;
   localparam AplusB  = 4;
   localparam AminusB = 5;
   localparam Bplus1  = 6;
   localparam Bminus1 = 7;

   assign memory_address = effB;
   assign memory_D       = effA;
   assign memory_read    = exec_mem_read;
   assign memory_write   = exec_mem_write;

   (* keep = "true" *)
   bit decode_take_branch;
   (* keep = "true" *)
   bit conditionZ;
   (* keep = "true" *)
   bit conditionNZ;
   always@(*) begin : decode_branch_evaluateZ
      case (decode_instruction[4:3])
        2'b00: conditionZ = !decode_instruction[2];
        2'b01: conditionZ = !decode_instruction[2];
        2'b10: conditionZ = (Zflag | commit_Z_write) ^ decode_instruction[2];
        2'b11: conditionZ = Cflag ^ decode_instruction[2];
      endcase
   end
   always@(*) begin : decode_branch_evaluateNZ
      case (decode_instruction[4:3])
        2'b00: conditionNZ = !decode_instruction[2];
        2'b01: conditionNZ = !decode_instruction[2];
        2'b10: conditionNZ = (Zflag & !commit_Z_write) ^ decode_instruction[2];
        2'b11: conditionNZ = Cflag ^ decode_instruction[2];
      endcase
   end
   always@(*) begin : decode_branch_evaluate2
      bit [7:0] decode_branch_target;

      decode_take_branch = decode_is_branch && ((Q == 0) ? conditionZ : conditionNZ);

      if (decode_instruction[7])
        decode_branch_target = return_PC;
      else
        decode_branch_target = { decode_instruction[1:0], decode_prev_data[5:0] };

      if (decode_take_branch)
        fetch_PC = decode_branch_target;
      else if (decode_not_mem_read)
        fetch_PC = decode_PC + 1;
      else
        fetch_PC = decode_PC;
   end

   always@(posedge clk) begin : fetch
      if (fetch_instruction[7:6] == 2'b00 && fetch_prev_was_data)
        decode_is_branch <= 1;
      else if (fetch_instruction[4:3] == 2'b00)
        decode_is_branch <= 0;
      else if (fetch_instruction[7:5] == 3'b101)
        decode_is_branch <= 1;
      else
        decode_is_branch <= 0;

      // We can only update the SP every other clock cycle, so we can process
      // the SP both in fetch & decode.
      return_PC <= stack[SP];

      decode_instruction <= fetch_instruction;

      if (!fetch_prev_was_data && fetch_instruction[7:6] == 2'b00
                                                          && decode_not_mem_read)
        fetch_prev_was_data <= 1;
      else
        fetch_prev_was_data <= 0;

      decode_prev_was_data <= fetch_prev_was_data;

      // Work out if this instruction really does read memory.  The memory read
      // takes two cycles.  For the second cycle in fetch (= first cycle in
      // decode), the instruction is bogus and and we take care to ignore it.
      if (fetch_instruction[7:6] == 2'b00
          || fetch_instruction[7:5] == 3'b101)
        decode_not_mem_read <= 1;
      else
        decode_not_mem_read <= !fetch_instruction[2] | !decode_not_mem_read;

      decode_PC <= fetch_PC;

      if (reset_input)
        fetch_reset <= 1;
      else if (fetch_prev_was_data)
        fetch_reset <= 0;

      // In decode_mem_read the fetch instruction is bogus; we need to continue
      // the previous instruction.  So pause appropriate outputs.
      if (!decode_not_mem_read) begin
         decode_instruction <= decode_instruction;
         decode_is_branch <= decode_is_branch;
      end

      // If we took a branch then the currently fetched instruction is bogus.
      // Pass a NOP (mov A,A) through to decode.
      if (decode_take_branch) begin
         fetch_prev_was_data <= 0;
         decode_not_mem_read <= 1;
         decode_is_branch <= 0;
         decode_instruction <= 8'h80;
      end
   end

   always@(posedge clk) begin : decode
      decode_prev_data <= decode_instruction[5:0];

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
        stack[SP - 1] <= decode_PC;

      if (decode_instruction[7])
        exec_reg_to_write <= decode_instruction[4:3]; // Load / inc /dec.
      else
        exec_reg_to_write <= 2'b00;     // ALU.

      if (decode_instruction[7:6] != 2'b00
          && decode_instruction[7:3] != 5'b01111
          && decode_instruction[7:5] != 3'b101)
        exec_reg_write <= decode_not_mem_read;
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
      if (exec_mem_read || decode_prev_was_data)
        exec_reg_read <= 0;
      else
        exec_reg_read <= 1;

      exec_reg_to_read <= decode_instruction[1:0];

      if (exec_reg_write && exec_reg_to_write == decode_instruction[1:0])
        exec_reg_ff <= 1;
      else
        exec_reg_ff <= 0;

      if (decode_prev_was_data && !exec_mem_read)
        exec_constant <= { decode_instruction[1:0], decode_prev_data };
      else
        exec_constant <= 0;

      exec_mem_read <= !decode_not_mem_read;
      exec_Z_write <= decode_instruction[6] && decode_not_mem_read;
      exec_C_write <= (decode_instruction[7:6] == 2'b01) && decode_not_mem_read;
   end

   wire [7:0] effB;
   wire [7:0] effA;
   assign effB = exec_reg_read
                 ? (exec_reg_ff ? Q : regs[exec_reg_to_read])
                 : exec_constant;
   assign effA = commit_reg_write_A ? Q : A;

   (* keep = "true" *)
   bit [7:0] logicB0;
   (* keep = "true" *)
   bit [7:0] logicB1;
   (* keep = "true" *)
   bit [10:0] addendA;
   always@(*) begin : addends
      logicB0 = 0;
      logicB1 = 8'b11111111;
      addendA = 0;
      case (exec_op)
        AorB:    logicB0 = effA;
        AxorB:   logicB0 = effA;
        AminusB: logicB0 = 8'b11111111;
      endcase
      case (exec_op)
        AandB:   logicB1 = effA;
        AxorB:   logicB1 = ~effA;
        AminusB: logicB1 = 0;
      endcase
      case (exec_op)
        AplusB:  addendA = { 2'b01, effA, 1'b1 };
        AminusB: addendA = { 2'b01, effA, 1'b1 };
        Bplus1:  addendA = 11'b00000000010;
        Bminus1: addendA = 11'b00111111110;
        AandB:   addendA = 11'b01000000000;
      endcase
      if (!exec_C_write) begin
         addendA[10] = Cflag;
         addendA[9] = 0;
      end
   end

   always@(posedge clk) begin : exec
      reg [10:0] addendB;
      reg [10:0] sum;

      addendB = { 2'b00,
        ((effB | memory_Q) & logicB1) | (~effB & ~memory_Q & logicB0), 1'b0 };

      if (exec_op == AminusB)
        addendB[0] = Cflag | !exec_use_C;
      if (exec_op == AplusB)
        addendB[0] = Cflag & exec_use_C;
      if (exec_op == AandB)
        addendB[9] = 1'b1;

      // If we are not writing C, then overwrite logicA/B[9] to force preserving
      // the previous value.
      if (!exec_C_write)
         addendB[9] = 0;

      sum = addendA + addendB;

      Q <= sum[8:1];
      Cflag <= sum[10];
   end

   always@(posedge clk) begin : commit
      commit_reg_write <= exec_reg_write;
      commit_reg_to_write <= exec_reg_to_write;
      commit_reg_write_A <= exec_reg_write && exec_reg_to_write == 0;
      commit_Z_write <= exec_Z_write;

      if (commit_reg_write)
        regs[commit_reg_to_write] <= Q;

      if (commit_reg_write_A)
        A <= Q;

      if (commit_Z_write)
        Zflag <= (Q == 0);
   end
endmodule
