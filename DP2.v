//两段共阳
module DP2_P(
    input clk,
    input[3:0] num2,
    input[3:0] num1,
    output wire[6:0] data,  // GFEDCBA
    output wire[1:0] an
);

reg state = 0;
wire[3:0] num[1:0];

assign num[1] = num2;
assign num[0] = num1;

DP1_P dp1(num[state], data);
AN2 an2(state, an);

always @(posedge clk)
    state <= ~state;

endmodule



//两段共阴
module DP2_N(
    input clk,
    input[3:0] num2,
    input[3:0] num1,
    output wire[6:0] data,  // GFEDCBA
    output wire[1:0] an
);

reg state = 0;
wire[3:0] num[1:0];

assign num[1] = num2;
assign num[0] = num1;

DP1_N dp1(num[state], data);
AN2 an2(state, an);

always @(posedge clk)
    state <= ~state;

endmodule
