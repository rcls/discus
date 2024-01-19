module testinc();

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

   wire[7:0] prgram[0:11] = {
             8'h84,
             8'hd4,
             8'he9,
             8'hf2,
             8'h0b, 8'h30,
             8'h83,
             8'hd4,
             8'hd1,
             8'hd1,
             8'hd1,
             8'h60
             };

   initial begin : testit
      integer i;

      clk = 0;
      snoopp = 1;
      reset = 1;

      for (i = 0; i <= 11; i = i + 1) begin
         snoopa = i;
         snoopd = prgram[i];
         clk = 0;
         #10;
         clk = 1;
         #10;
         clk = 0;
      end

      snoopp = 0;
      reset = 0;

      for (i = 0; i <= 20; i = i + 1) begin
         clk = 0;
         #10;
         clk = 1;
         #10;
         clk = 0;
      end
   end

endmodule
