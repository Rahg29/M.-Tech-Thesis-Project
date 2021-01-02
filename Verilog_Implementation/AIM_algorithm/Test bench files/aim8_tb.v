`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2019 11:52:22
// Design Name: 
// Module Name: aim8_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aim8_tb();
reg signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8;
reg signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8;
reg clk;
wire signed [11:0] out_neuron;
aim8 uut (A1, A2, A3, A4, A5, A6, A7, A8, W1, W2, W3, W4, W5, W6, W7, W8, clk, out_neuron);

initial 
begin

clk=0;
A1 = 0;
A2 = 52;
A3 = -41;
A4 = 0;
A5 = -12;
A6 = 115;
A7 = 95;
A8 = 0;

W1 = 1;
W2 = -1;
W3 = 0;
W4 = 0;
W5 = -1;
W6 = 1;
W7 = 0;
W8 = -1;
end

always
begin
#5 clk = ~clk;
end

endmodule
