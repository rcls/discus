`timescale 1ns/1ps

module testadd();

   reg clk;
   reg reset;
   reg [7:0] snoopa;
   reg [7:0] snoopd;
   reg snoopp;

   discus dcs(.clk(clk),
              .reset(reset),
              .snoop_clk(clk),
              .snoopa(snoopa),
              .snoopd(snoopd),
              .snoopq(),
              .snoopm(1'b0),
              .snoopp(snoopp));

   wire[7:0] prgram[0:12] = {
             8'h98,
             8'h0c, 8'h14,
             8'h03, 8'h92,
             8'he8,
             8'h0c, 8'h18,
             8'h82,
             8'h92,
             8'h92,
             8'h82,
             8'h60 };

   initial begin : testit
      integer i;

      clk = 0;
      snoopp = 1;
      reset = 1;

      #105;

      for (i = 0; i <= 255; i = i + 1) begin
         if (prgram[i] != 0) begin
            snoopa = i;
            snoopd = prgram[i];
            clk = 0;
            #5;
            clk = 1;
            #5;
            clk = 0;
         end
      end

      snoopp = 0;
      reset = 0;

      for (i = 0; i <= 20; i = i + 1) begin
         clk = 0;
         #5;
         clk = 1;
         #5;
         clk = 0;
      end
   end

endmodule
