`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2019 01:16:58
// Design Name: 
// Module Name: ccp_test
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


module ccp_test();
reg signed [8:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
                 a21, a22, a23, a24;
reg signed [1:0] w1_0, w1_1, w1_2, w1_3, w1_4, w1_5, w1_6, w1_7, w1_8, 
                 w1_9, w1_10, w1_11, w1_12, w1_13, w1_14, w1_15;
reg signed [1:0] w2_0, w2_1, w2_2, w2_3, w2_4, w2_5, w2_6, w2_7, w2_8,
                 w2_9, w2_10, w2_11, w2_12, w2_13, w2_14, w2_15;
reg clk;
wire signed [11:0] OR1_0, OR1_1, OR1_2, OR1_3;
wire signed [11:0] OR2_0, OR2_1, OR2_2, OR2_3;

CNN_Comp_Parallel uut (a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
              a21, a22, a23, a24, w1_0, w1_1, w1_2, w1_3, w1_4, w1_5, w1_6, w1_7, w1_8, 
              w1_9, w1_10, w1_11, w1_12, w1_13, w1_14, w1_15, w2_0, w2_1, w2_2, w2_3, w2_4, w2_5, w2_6, w2_7, w2_8,
                               w2_9, w2_10, w2_11, w2_12, w2_13, w2_14, w2_15, clk, OR1_0, OR1_1, OR1_2, OR1_3, OR2_0, OR2_1, OR2_2, OR2_3);

integer i=0;
initial 
begin

clk=0;

a0 = 0;
a1 = 1;
a2 = 2;
a3 = 3;
a4 = 4;
a5 = 5;
a6 = 6;
a7 = 7;
a8 = 8;
a9 = 9;
a10 = 10;
a11 = 11;
a12 = 12;
a13 = 13;
a14 = 14;
a15 = 15;
a16 = 16;
a17 = 17;
a18 = 18;
a19 = 19;
a20 = 20;
a21 = 21;
a22 = 22;
a23 = 23;
a24 = 24;

w1_0=-1;
w1_1=0;
w1_2=-1;
w1_3=0;
w1_4=1;
w1_5=0;
w1_6=1;
w1_7=0;
w1_8=-1;
w1_9=0;
w1_10=-1;
w1_11=0;
w1_12=1;
w1_13=0;
w1_14=1;
w1_15=0;

w2_0=0;
w2_1=1;
w2_2=0;
w2_3=-1;
w2_4=0;
w2_5=1;
w2_6=0;
w2_7=-1;
w2_8=0;
w2_9=1;
w2_10=0;
w2_11=-1;
w2_12=0;
w2_13=1;
w2_14=0;
w2_15=-1;

end

always
begin
#5 clk = ~clk;
end

endmodule
