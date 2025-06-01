module ff_ar_en_tb();
   logic clk, reset, en;
   logic [3:0] d, q;

   ff_ar_en dut(clk,reset,en,d,q);

   always
     begin
        clk = 1; #5;
        clk = 0; #5;
     end

   initial
     begin
        reset = 1; en = 0; d = 4'b0110; #5;
        assert(q === 4'b0000) else $error("q not reset");
        // 5ns
        reset = 0; en = 1; #10;
        assert(q === d) else $error("q not set when en=1");
        // 15ns
        d = 4'b1100; en = 0; #10;
        assert(q === 4'b0110) else $error("q set when en=0");
        // 25ns
        reset = 1; en = 1; #10;
        assert(q === '0) else $error("q set when reset=1");
        // 35ns
        reset = 0; #10;
        assert(q === d) else $error("q not set when en=1 after reset goes to 0");
        // 45ns
        
        $finish;
     end
   
endmodule // ff_ar_en_tb
