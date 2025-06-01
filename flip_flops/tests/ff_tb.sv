module ff_tb();
   logic clk;
   logic [3:0] d, q;

   ff dut(clk,d,q);

   // generate the clock
   always
     begin
        clk = 1; #5;
        clk = 0; #5;
     end

   initial begin
      #5;
      d = 4'b1100; #10;
      assert(q === 4'b1100) else $error("q not set to expected 4'b1100");

      d = 4'b0101; #10;
      assert(q === 4'b0101) else $error("q not set to expected 4'b0101");
      #2; d = 4'b1111; #1;
      assert(q === 4'b0101) else $error("q set before rising edge of clk to 4'b1111");
      #3;
      assert(q === 4'b1111) else $error("q not set on rising edge of clk to 4'b1111");

      $finish;
   end

endmodule // ff_tb
