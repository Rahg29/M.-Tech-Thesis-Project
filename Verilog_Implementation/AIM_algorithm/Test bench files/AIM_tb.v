`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2019 16:09:12
// Design Name: 
// Module Name: AIM_tb
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


module AIM_tb();

reg clk;
wire signed [15:0] out_neuron;
AIM uut ( clk, out_neuron);

initial 
begin
clk=0;
end

always
begin
#10 clk = ~clk;
end

endmodule
