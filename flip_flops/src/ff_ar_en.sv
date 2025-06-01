/** 
 * Flip-flop with asynchronous reset and enable
 */
module ff_ar_en(input logic        clk, reset, en,
                input logic [3:0]  d,
                output logic [3:0] q);
   always_ff@(posedge clk, posedge reset)
     begin
        if (reset) q <= '0;
        else if (en) q <= d;
     end
   
endmodule // ff_ar_en
