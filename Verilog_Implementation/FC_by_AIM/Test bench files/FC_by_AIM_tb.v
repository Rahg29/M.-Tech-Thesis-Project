`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2019 13:01:02
// Design Name: 
// Module Name: FC_by_AIM_tb
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


module FC_by_AIM_tb();
reg clk;
wire signed [15:0] OR1_1,OR1_2,OR1_3,OR1_4,OR1_5,OR1_6,OR1_7,OR1_8,OR1_9,OR1_10;

FC_by_AIM uut ( clk, OR1_1,OR1_2,OR1_3,OR1_4,OR1_5,OR1_6,OR1_7,OR1_8,OR1_9,OR1_10);
    
initial 
    begin
    clk=0;
    end
    
always
    begin
    #10 clk = ~clk;
    end
    
endmodule