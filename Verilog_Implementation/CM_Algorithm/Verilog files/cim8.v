`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2018 18:58:56
// Design Name: 
// Module Name: AIM
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


module cim8(
input signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8,
input signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8,
input clk,
output reg signed [11:0] out_neuron
);

reg signed [8:0] Activation [0:7];
reg signed [1:0] Weight [0:7];
reg signed [10:0] out_array [0:7];
integer i = 0, reset = 1;
reg signed [11:0] y= 12'd0;

reg [1:0]Pres_state;
reg [1:0] Next_state;

parameter S0=2'd0;
parameter S1=2'd1;
parameter S2=2'd2;
parameter S3=2'd3;

always @(posedge clk)
begin
    if (reset == 1)
    Pres_state = S0;
    
    else
    Pres_state = Next_state;
end


always @(posedge clk)
begin

case(Pres_state)

S0:begin
    reset=1'd0;
    Weight[0] = W1;
    Weight[1] = W2;
    Weight[2] = W3;
    Weight[3] = W4;
    Weight[4] = W5;
    Weight[5] = W6;
    Weight[6] = W7;
    Weight[7] = W8;
        
    Activation[0] = A1;
    Activation[1] = A2;
    Activation[2] = A3;
    Activation[3] = A4;
    Activation[4] = A5;    
    Activation[5] = A6;
    Activation[6] = A7;
    Activation[7] = A8;
            
    Next_state = S1;
end


S1: begin
    out_array[0] = Activation[0] * Weight[0];
    out_array[1] = Activation[1] * Weight[1];
    out_array[2] = Activation[2] * Weight[2];
    out_array[3] = Activation[3] * Weight[3];
    out_array[4] = Activation[4] * Weight[4];
    out_array[5] = Activation[5] * Weight[5];
    out_array[6] = Activation[6] * Weight[6];
    out_array[7] = Activation[7] * Weight[7];
    Next_state = S2;
    end

S2:
 begin
    if (i<=7)
        begin
        y = y + out_array[i]; 
        i = i+1;
        Next_state = S2;
        end
        
    else
        begin
        Next_state = S3;    
        end
 end

S3:begin
   out_neuron[11:0] = y[11:0];
   end


endcase
end


endmodule
