//四段共阳
module DP4_P(
    input clk,
    input[3:0] num4,
    input[3:0] num3,
    input[3:0] num2,
    input[3:0] num1,
    output wire[6:0] data,  // GFEDCBA
    output wire[3:0] an
);

reg[1:0] state = 0;
wire[3:0] num[3:0];

assign num[3] = num4;
assign num[2] = num3;
assign num[1] = num2;
assign num[0] = num1;

DP1_P dp1(num[state], data);
AN4_P an4(state, an);

always @(posedge clk)
case (state)
    2'b00: state <= 2'b01;
    2'b01: state <= 2'b10;
    2'b10: state <= 2'b11;
    2'b11: state <= 2'b00;
endcase

endmodule


//四段共阴
module DP4_N(
    input clk,
    input[3:0] num4,
    input[3:0] num3,
    input[3:0] num2,
    input[3:0] num1,
    output wire[6:0] data,  // GFEDCBA
    output wire[3:0] an
);

reg[1:0] state = 0;
wire[3:0] num[3:0];

assign num[3] = num4;
assign num[2] = num3;
assign num[1] = num2;
assign num[0] = num1;

DP1_N dp1(num[state], data);
AN4_N an4(state, an);

always @(posedge clk)
case (state)
    2'b00: state <= 2'b01;
    2'b01: state <= 2'b10;
    2'b10: state <= 2'b11;
    2'b11: state <= 2'b00;
endcase

endmodule
