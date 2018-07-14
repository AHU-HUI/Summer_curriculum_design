/***四段共阳位选***/

module AN4_P(
    input[1:0] state,
    output reg[3:0] an
);

always @(state)
case (state)
    2'b00: an = 4'b0001;
    2'b01: an = 4'b0010;
    2'b10: an = 4'b0100;
    2'b11: an = 4'b1000;
endcase

endmodule


/***四段共阴位选***/
module AN4_N(
    input[1:0] state,
    output reg[3:0] an
);

always @(state)
case (state)
    2'b00: an = 4'b1110;
    2'b01: an = 4'b1101;
    2'b10: an = 4'b1011;
    2'b11: an = 4'b0111;
endcase

endmodule
