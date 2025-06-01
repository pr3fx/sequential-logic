module ff_ar_wrapper(input        clk, reset,
                     input [3:0]  d,
                     output [3:0] q);
   ff_ar ff_ar_0(
                 .clk(clk),
                 .reset(reset),
                 .d(d),
                 .q(q)
                 );

endmodule // ff_ar_wrapper
