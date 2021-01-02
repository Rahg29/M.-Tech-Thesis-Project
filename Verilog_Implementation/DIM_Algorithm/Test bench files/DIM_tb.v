`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2019 20:14:53
// Design Name: 
// Module Name: DIM_tb
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


module DIM_tb();
reg signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16,  A17, A18, A19, A20;
reg signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16,  W17, W18, W19, W20;
reg clk;
wire signed [12:0] out_neuron;
DIM uut (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16,  A17, A18, A19, A20, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16,  W17, W18, W19, W20, clk, out_neuron);


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
A9 = 5;
A10 = 115;
A11 = 0;
A12 = 52;
A13 = -41;
A14 = 0;
A15 = -12;
A16 = 115;
A17 = 95;
A18 = 0;
A19 = 5;
A20 = -65;

W1 = 1;
W2 = -1;
W3 = 0;
W4 = 0;
W5 = -1;
W6 = 1;
W7 = 0;
W8 = -1;
W9 = 1;
W10 = 0;
W11 = 1;
W12 = -1;
W13 = 0;
W14 = 0;
W15 = -1;
W16 = 1;
W17 = 0;
W18 = -1;
W19 = 1;
W20 = 0;

end

always
begin
#5 clk = ~clk;
end

endmodule
