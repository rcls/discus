module discus(input wire clk,
              input wire reset,
              input wire [7:0] snoopa,
              input wire [7:0] snoopd,
              output reg [7:0] snoopq,
              input wire snoopm,
              input wire snoopp);

   wire memclk = ~clk;

   reg [7:0] memory[511:0];
   reg [7:0] prgram[255:0];

   initial begin : initmem
      integer i;
      for (i = 0; i < 256; i = i + 1)
        memory[i] = i;
   end

   always@(posedge memclk) begin
      if (snoopm)
        memory[snoopa] <= snoopd;

      if (snoopp)
        prgram[snoopa] <= snoopd;

      snoopq <= memory[snoopa];
   end

   reg [7:0] PC;
   reg [7:0] A;
   reg       Cflag;
   reg [7:0] Zdata;
   // reg       Zflag;
   reg [7:0] regs[15:0] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 };
   reg [7:0] stack[3:0];
   reg [1:0] SP;

   // This is out-of-date in the execution unit!
   reg [7:0] instruction;

   // For instruction decode only.
   reg [5:0] prev_data;
   reg prev_was_data;

   // For exec.
   reg [7:0] constant;
   reg [7:0] B;
   reg use_constant;
   reg [1:0] reg_to_write;
   reg [1:0] reg_to_read;
   reg reg_write;
   reg use_C;
   reg C_write;
   reg Z_write;
   reg memory_use;
   reg memory_write;
   reg [2:0] arith_mode;
   reg [2:0] op;

   localparam AplusB  = 0;
   localparam AminusB = 1;
   localparam Bpass   = 2;
   localparam Bplus1  = 3;
   localparam Bminus1 = 4;
   localparam AandB   = 5;
   localparam AorB    = 6;
   localparam AxorB   = 7;

   always@(posedge memclk)
     instruction <= prgram[PC];

   always@(posedge clk) begin : fetch
      reg [7:0] jump_target;
      reg is_jump;                   // Includes call.
      reg is_ret;
      reg Zflag;
      reg condition;

      prev_data <= instruction[5:0];

      prev_was_data <= (instruction[7:6] == 2'b0 && !prev_was_data
                        && !reset);

      jump_target = { prev_data, instruction[1:0] };

      use_constant <= prev_was_data;
      if (prev_was_data)
        constant <= jump_target;
      else
        constant <= 0;

      is_jump = instruction[7:6] == 2'b0 && prev_was_data;
      is_ret = instruction[7:5] == 3'b101;

      Zflag = (Zdata == 0);
      case (instruction[4:2])
        3'b000, 3'b010: condition = 0;
        3'b001, 3'b011: condition = 1;
        3'b100: condition = Zflag;
        3'b101: condition = !Zflag;
        3'b110: condition = Cflag;
        3'b111: condition = !Cflag;
      endcase;

      if (reset)
        PC <= 0;
      else if (is_jump && condition) begin
         PC <= jump_target;
         if (instruction[5])
           begin
              stack[SP - 1] <= PC;
              SP <= SP - 1;
           end
      end
      else if (is_ret && condition) begin
         PC <= stack[SP] + 1;
         SP <= SP + 1;
      end
      else
        PC <= PC + 1;

      if (instruction[7])
        reg_to_write <= instruction[4:3];
      else
        reg_to_write <= 0;

      // FIXME - this doesn't cover 'in' and 'out'.
      if (instruction[7:6] != 2'b00
          && instruction[7:3] != 5'b01111
          && instruction[7:5] != 3'b101)
        reg_write <= 1;
      else
        reg_write <= 0;

      if (instruction[7:2] == 6'b101001)
        memory_write <= 1;
      else
        memory_write <= 0;

      // Arith operation...
      if (instruction[7:4] == 5'b0100)
        op <= AplusB;
      else if (instruction[7:4] == 5'b0101)
        op <= AminusB;
      else if (instruction[7:3] == 5'b01100)
        op <= AorB;
      else if (instruction[7:3] == 5'b01101)
        op <= AxorB;
      else if (instruction[7:3] == 5'b01110)
        op <= AandB;
      else if (instruction[7:3] == 5'b01111)
        op <= AminusB;
      else if (instruction[7:5] == 3'b110)
        op <= Bminus1;
      else if (instruction[7:5] == 3'b111)
        op <= Bplus1;
      else
        op <= Bpass;

      use_C <= (instruction[7:5] == 5'b01001 || instruction[7:5] == 5'b01011);

      reg_to_read <= instruction[1:0];
      memory_use <= instruction[2];      // Includes writes.
      Z_write <= instruction[6];
      C_write <= (instruction[7:6] == 2'b01);
   end

   always@(posedge memclk) begin : execmem
      reg [8:0] V;
      integer i;
      for (i = 0; i < 8; i = i + 1)
        V[i] = regs[{use_constant, constant[i], reg_to_read}][i];
      V[8] = memory_use;

      B <= memory[V];
      if (memory_write)
        memory[V] <= A;
   end

   always@(posedge clk) begin : exec
      reg [8:0] logicA;
      reg [8:0] logicB;
      reg [9:0] sum;

      case (op)
        AandB:   logicA = { A & B, 1'b1 };
        AorB:    logicA = { A | B, 1'b0 };
        AxorB:   logicA = { A ^ B, 1'b0 };
        AplusB:  logicA = { A, Cflag & use_C };
        AminusB: logicA = { A, Cflag | !use_C };
        Bpass:   logicA = 0;
        Bplus1:  logicA = 9'b000000010;
        Bminus1: logicA = 9'b111111110;
      endcase
      case (op)
        AandB:   logicB = 9'b111111111;
        AorB:    logicB = 0;
        AxorB:   logicB = 0;
        AplusB:  logicB = { B, 1'b1 };
        AminusB: logicB = { ~B, 1'b1 };
        Bpass:   logicB = { B, 1'b0 };
        Bplus1:  logicB = { B, 1'b0 };
        Bminus1: logicB = { B, 1'b0 };
      endcase

      sum = { 1'b0, logicA } + { 1'b0, logicB };
      if (C_write)
        Cflag <= sum[9];
      if (reg_write)
        regs[{2'b00, reg_to_write}] <= sum[8:1];
      if (reg_write && reg_to_write == 0)
        A <= sum[8:1];
      if (Z_write)
        // Zflag <= (sum[8:1] == 0);
        Zdata = sum[8:1];
   end
endmodule
