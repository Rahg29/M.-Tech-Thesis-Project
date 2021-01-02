`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 09:35:26
// Design Name: 
// Module Name: cmp_tb
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

module cmp_tb();
//reg signed [8:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
//                 a21, a22, a23, a24;
//reg signed [1:0] w1_0, w1_1, w1_2, w1_3, w1_4, w1_5, w1_6, w1_7, w1_8;
//reg signed [1:0] w2_0, w2_1, w2_2, w2_3, w2_4, w2_5, w2_6, w2_7, w2_8;
reg clk;
wire signed [11:0] OR1_0, OR1_1, OR1_2, OR1_3, OR1_4, OR1_5, OR1_6, OR1_7, OR1_8;
wire signed [11:0] OR2_0, OR2_1, OR2_2, OR2_3, OR2_4, OR2_5, OR2_6, OR2_7, OR2_8;

CNN_MUL_Parallel uut (
              clk, OR1_0, OR1_1, OR1_2, OR1_3, OR1_4, OR1_5, OR1_6, OR1_7, OR1_8, 
              OR2_0, OR2_1, OR2_2, OR2_3, OR2_4, OR2_5, OR2_6, OR2_7, OR2_8);

integer i=0;
initial 
begin

clk=0;

end

always
begin
#5 clk = ~clk;
end

endmodule

