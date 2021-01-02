`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2018 14:13:05
// Design Name: 
// Module Name: Relu
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

module Relu(
input signed [15:0] OA,
output reg signed [15:0] OR
);
    
always @ (*)
begin
    if (OA > 0)
    OR <= OA;
    
    else if (OA <0)
    OR <=0;
end

endmodule
