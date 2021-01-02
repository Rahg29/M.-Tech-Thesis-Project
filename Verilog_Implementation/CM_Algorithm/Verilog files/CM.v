`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2018 05:01:24
// Design Name: 
// Module Name: CM
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


module CM(
input signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16,  A17, A18, A19, A20,
input signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16,  W17, W18, W19, W20,
input clk,
output reg signed [12:0] out_neuron
);
reg signed [8:0] Activation [0:19];
reg signed [1:0] Weight [0:19];
reg signed [10:0] out_array [0:19];
integer i = 0, reset = 1;
reg signed [12:0] y= 13'd0;

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

    reset = 0;
    
    Weight[0] = W1;
    Weight[1] = W2;
    Weight[2] = W3;
    Weight[3] = W4;
    Weight[4] = W5;
    Weight[5] = W6;
    Weight[6] = W7;
    Weight[7] = W8;
    Weight[8] = W9;
    Weight[9] = W10;
    Weight[10] = W11;
    Weight[11] = W12;
    Weight[12] = W13;
    Weight[13] = W14;
    Weight[14] = W15;
    Weight[15] = W16;
    Weight[16] = W17;
    Weight[17] = W18;
    Weight[18] = W19;
    Weight[19] = W20;
    
    Activation[0] = A1;
    Activation[1] = A2;
    Activation[2] = A3;
    Activation[3] = A4;
    Activation[4] = A5;    
    Activation[5] = A6;
    Activation[6] = A7;
    Activation[7] = A8;
    Activation[8] = A9;
    Activation[9] = A10;
    Activation[10] = A11;
    Activation[11] = A12;
    Activation[12] = A13;
    Activation[13] = A14;
    Activation[14] = A15;    
    Activation[15] = A16;
    Activation[16] = A17;
    Activation[17] = A18;
    Activation[18] = A19;
    Activation[19] = A20;

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
    out_array[8] = Activation[8] * Weight[8];
    out_array[9] = Activation[9] * Weight[9];
    out_array[10] = Activation[10] * Weight[10];
    out_array[11] = Activation[11] * Weight[11];
    out_array[12] = Activation[12] * Weight[12];
    out_array[13] = Activation[13] * Weight[13];
    out_array[14] = Activation[14] * Weight[14];
    out_array[15] = Activation[15] * Weight[15];
    out_array[16] = Activation[16] * Weight[16];
    out_array[17] = Activation[17] * Weight[17];
    out_array[18] = Activation[18] * Weight[18];
    out_array[19] = Activation[19] * Weight[19];

    Next_state = S2;

    end

S2: 
begin
    if (i <= 19)
        begin
        y = y + out_array[i]; 
        i = i+1;
        Next_state = S2;
        end
    
    else
    Next_state = S3;    
    
end
    
S3: begin
    out_neuron[12:0] = y[12:0];
    end

endcase
end


endmodule
