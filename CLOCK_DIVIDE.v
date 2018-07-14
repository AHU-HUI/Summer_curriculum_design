module CLOCK_DIVIDE
#(IN = 12000000, OUT = 100, L = 17)  //2^17>120000
// OUT应当是一个偶数，否则高低电平占空比不相同
// L为IN与OUT的倍数的位数
(
    input clk_in,
    input rst,
    output wire clk_out
);

reg clk_p = 0;
reg clk_n = 0;
wire base_p_cf;
wire base_n_cf;

COUNTER #((IN/OUT-1)/2, L) base_p(.clk(clk_in), .rst(rst), .cf(base_p_cf));
COUNTER #((IN/OUT-1)/2, L) base_n(.clk(~clk_in), .rst(rst), .cf(base_n_cf));

always @(posedge base_p_cf, negedge rst)
if (rst==0)
    clk_p <= 0;
else
    clk_p <= ~clk_p;

always @(posedge base_n_cf, negedge rst)
if (rst==0)
    clk_n <= 0;
else
    clk_n <= ~clk_n;

assign clk_out = clk_p & clk_n;

endmodule