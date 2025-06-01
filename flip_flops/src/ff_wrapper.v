module ff_wrapper(input        clk,
                  input [3:0]  d,
                  output [3:0] q);
   ff ff_0(
           .clk(clk),
           .d(d),
           .q(q)
           );
   
endmodule // ff_wrapper
