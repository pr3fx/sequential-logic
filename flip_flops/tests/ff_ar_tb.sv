module ff_ar_tb();
   logic clk, reset;
   logic [3:0] d, q;

   ff_ar dut(clk,reset,d,q);

   always
     begin
        clk = 1; #5;
        clk = 0; #5;
     end

   initial
     begin
        reset = 1; d = 4'b0110; #5;
        assert(q === 4'b0000) else $error("q not reset");
        reset = 0;
        // 5ns
        d = 4'b1100; #10;
        assert(q === 4'b1100) else $error("q not set to expected 4'b1100");
        // 15ns
        d = 4'b0101; #10;
        assert(q === 4'b0101) else $error("q not set to expected 4'b0101");
        // 25ns
        #2; d = 4'b1111; #1;
        assert(q === 4'b0101) else $error("q set before rising edge of clk to 4'b1111");
        // 28ns
        #3;
        assert(q === 4'b1111) else $error("q not set on rising edge of clk to 4'b1111");
        // 31ns
        #1; reset = 1; #1;
        assert(q === 4'b0000) else $error("q not reset");
        // 33ns
        reset = 0; #2;
        // 35ns
        
        $finish;
     end

endmodule // ff_ar_tb
