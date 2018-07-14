module COUNTER
#(parameter N = 7'd100, L = 7)
(
    input clk,
    input rst,
    output reg[L-1:0] num = 0,
    output reg cf = 0
);

always @(posedge clk or negedge rst)
if (rst==0)
    num <= 0;
else
    if (num==N-1) begin
        num <= 0;
        cf <= 1;
        end
    else begin
        num <= num + 1;
        cf <= 0;
        end

endmodule
