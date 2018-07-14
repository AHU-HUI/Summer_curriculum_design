module AN2(
    input state,
    output reg[1:0] an
);

always @(state)
case (state)
    1'b0: an = 2'b10;
    1'b1: an = 2'b01;
endcase

endmodule
