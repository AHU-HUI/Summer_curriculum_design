module CLOCK(
    input clk,
    input rst,
    input button,
    output wire[6:0] data3,
    output wire[6:0] data2,
    output wire[6:0] data1,
    output wire[3:0] an,
    output wire dig3,
    output wire dig2
);

reg working = 0;
wire working_clk;
wire base1_out, base1_cf;
wire base2_out, base2_cf;
wire base3_out, base3_cf;

wire[3:0] MSL_out, MSH_out, SL_out, SH_out, ML_out, MH_out;
wire MSL_cf; wire MSH_cf;
wire SL_cf; wire SH_cf;
wire ML_cf; wire MH_cf;

assign working_clk = working & clk;

always @(posedge button, negedge rst)
if (rst==0)
    working <= 0;
else
    working <= ~working;


CLOCK_DIVIDE #(12000000, 100, 17) base1(working_clk, rst, base1_cf);
CLOCK_DIVIDE #(12000000, 6000, 11) base2(clk, rst, base2_cf);

COUNTER #(4'd10, 4) MSL(base1_cf, rst, MSL_out, MSL_cf);    //十分频
COUNTER #(4'd10, 4) MSH(MSL_cf, rst, MSH_out, MSH_cf);      //十分频
COUNTER #(4'd10, 4) SL(MSH_cf, rst, SL_out, SL_cf);         //十分频
COUNTER #(4'd6, 4) SH(SL_cf, rst, SH_out, SH_cf);           //六分频
COUNTER #(4'd10, 4) ML(SH_cf, rst, ML_out, ML_cf);          //十分频
COUNTER #(4'd6, 4) MH(ML_cf, rst, MH_out, MH_cf);           //六分频

DP1_N dp3(MH_out, data3);
DP1_N dp2(ML_out, data2);
DP4_P dp1(base2_cf, SH_out, SL_out, MSH_out, MSL_out, data1, an);

assign dig3 = 0;
assign dig2 = 0;

endmodule
