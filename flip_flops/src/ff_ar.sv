/**
 * Flip-flop with asynchronous reset
 */
module ff_ar(input logic        clk, reset,
             input logic [3:0]  d,
             output logic [3:0] q);

   // asyncronous reset
   always_ff@(posedge clk, posedge reset)
     if (reset) q <= 4'b0000;
     else       q <= d;
     
endmodule // ff_ar
