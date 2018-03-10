module testcall();

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

   wire[7:0] prgram[0:9] = {
             8'h03, 8'h00,
             8'ha8,
             8'h06, 8'h00,
             8'ha8,
             8'h09, 8'h00,
             8'ha8,
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
            #10;
            clk = 1;
            #10;
            clk = 0;
         end
      end

      snoopp = 0;
      reset = 0;

      for (i = 0; i <= 40; i = i + 1) begin
         clk = 0;
         #10;
         clk = 1;
         #10;
         clk = 0;
      end
   end

endmodule
