`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2018 15:26:44
// Design Name: 
// Module Name: CNN_by_AIM
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

module FC_by_DIM(

//input signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8,
//input signed [1:0] W1_1, W1_2, W1_3, W1_4, W1_5, W1_6, W1_7, W1_8,
//input signed [1:0] W2_1, W2_2, W2_3, W2_4, W2_5, W2_6, W2_7, W2_8, 
//input signed [1:0] W3_1, W3_2, W3_3, W3_4, W3_5, W3_6, W3_7, W3_8, 
input clk,
output signed [15:0] OR1_1,OR1_2,OR1_3,OR1_4,OR1_5,OR1_6,OR1_7,OR1_8,OR1_9,OR1_10

);

wire signed [15:0] OA1_1,OA1_2,OA1_3,OA1_4,OA1_5,OA1_6,OA1_7,OA1_8,OA1_9,OA1_10;

dim d1 ( clk, OA1_1);
dim d2 ( clk, OA1_2);
dim d3 ( clk, OA1_3);
dim d4 ( clk, OA1_4);
dim d5 ( clk, OA1_5);
dim d6 ( clk, OA1_6);
dim d7 ( clk, OA1_7);
dim d8 ( clk, OA1_8);
dim d9 ( clk, OA1_9);
dim d10 ( clk, OA1_10);

Relu R1 (OA1_1, OR1_1);
Relu R2 (OA1_2, OR1_2);
Relu R3 (OA1_3, OR1_3);
Relu R4 (OA1_4, OR1_4);
Relu R5 (OA1_5, OR1_5);
Relu R6 (OA1_6, OR1_6);
Relu R7 (OA1_7, OR1_7);
Relu R8 (OA1_8, OR1_8);
Relu R9 (OA1_9, OR1_9);
Relu R10 (OA1_10, OR1_10);



endmodule
