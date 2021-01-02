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

module FC_by_AIM(

input clk,
output signed [15:0] OR1_1,OR1_2,OR1_3,OR1_4,OR1_5,OR1_6,OR1_7,OR1_8,OR1_9,OR1_10

);

wire signed [15:0] OA1_1,OA1_2,OA1_3,OA1_4,OA1_5,OA1_6,OA1_7,OA1_8,OA1_9,OA1_10;

aim d1 ( clk, OA1_1);
aim d2 ( clk, OA1_2);
aim d3 ( clk, OA1_3);
aim d4 ( clk, OA1_4);
aim d5 ( clk, OA1_5);
aim d6 ( clk, OA1_6);
aim d7 ( clk, OA1_7);
aim d8 ( clk, OA1_8);
aim d9 ( clk, OA1_9);
aim d10 ( clk, OA1_10);

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
