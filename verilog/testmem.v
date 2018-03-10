module testmem();

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

   wire[7:0] prgram[0:15] = {
             8'h68,
             8'h15, 8'ha4,
             8'he0,
             8'h08, 8'ha4,
             8'he0,
             8'h01, 8'ha4,
             8'h01, 8'h8c,
             8'h08, 8'h94,
             8'h15, 8'h9c,
             8'ha8
             };

   initial begin : testit
      integer i;

      clk = 0;
      snoopp = 1;
      reset = 1;

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

      for (i = 0; i < 32; i = i + 1) begin
         snoopa = i;
         clk = 0;
         #5;
         clk = 1;
         #5;
         clk = 0;
      end
   end

endmodule
