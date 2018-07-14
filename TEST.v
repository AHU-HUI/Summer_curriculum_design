`timescale 1ns / 1ps
module TEST;

reg clk = 0;
reg rst = 0;
reg button = 0;
wire[6:0] data3;
wire[6:0] data2;
wire[6:0] data1;
wire[3:0] an;
wire dig3;
wire dig2;

always
#1 clk = ~clk;

initial
begin
    clk = 0;
    button = 0;
    #1 rst = 1;
    #1 rst = 0;
    #1 button = 1;
    #1 button = 0;
end

CLOCK clock(clk, rst, button, data3, data2, data1, an, dig3, dig2);

endmodule
