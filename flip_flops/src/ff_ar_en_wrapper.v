module ff_ar_en_wrapper(input        clk, reset, en,
                        input [3:0]  d,
                        output [3:0] q);

   ff_ar_en_wrapper ff_ar_en_wrapper_0(.clk(clk),
                                       .reset(reset),
                                       .en(en),
                                       .d(d),
                                       .q(q));
   
endmodule // ff_ar_en_wrapper
