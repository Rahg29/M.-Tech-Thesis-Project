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


module aim8(
input signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8,
input signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8,
input clk,
output reg signed [11:0] out_neuron
);
reg signed [8:0] Activation [0:7];
reg signed [1:0] Weight [0:7];
reg [4:0] Inc_Act [0:7];
reg signed [8:0] Act_element [0:5];
reg [7:0] and_op;
reg [7:0] Act_Index;
reg [7:0] Weight_Index;

integer i=0, c = 0, e = 0;
reg signed [11:0] y= 12'd0;
reg [1:0]Pres_state;
reg [1:0] Next_state;

parameter S0=2'd0;
parameter S1=2'd1;
parameter S2=2'd2;
parameter S3=2'd3;

always @(posedge clk)
begin
    Pres_state = Next_state;
end





always @(posedge clk)
begin

case(Pres_state)


default: begin
Weight[0] <= W1;
Weight[1] <= W2;
Weight[2] <= W3;
Weight[3] <= W4;
Weight[4] <= W5;
Weight[5] <= W6;
Weight[6] <= W7;
Weight[7] <= W8;

Activation[0] <= A1;
Activation[1] <= A2;
Activation[2] <= A3;
Activation[3] <= A4;
Activation[4] <= A5;
Activation[5] <= A6;
Activation[6] <= A7;
Activation[7] <= A8;

Next_state = S0;
end

S0:begin
   
    out_neuron[11:0] = i;
    if (i<=7)
    begin
     
        if(Activation[i] == 9'd0)
        begin
            if(Weight[i] == -2'd1)
            begin
            Weight_Index[i] = 1'b1;
            Act_Index[i] = 1'b0;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            Next_state = S0;
            end
            
            else if(Weight[i] == 2'd1)
            begin
            Weight_Index[i] = 1'b1;
            Act_Index[i] = 1'b0;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            Next_state = S0;
            end
            
            else if(Weight[i] == 2'd0)
            begin
            Weight_Index[i] = 1'b0;
            Act_Index[i] = 1'b0;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            Next_state = S0;
            end       
        
        end
        
        else if(Activation[i] != 9'd0)
        begin
            if(Weight[i] == -2'd1)
            begin
            Weight_Index[i] = 1'b1;
            Act_element[e] = Activation[i];
            Act_Index[i] = 1'b1;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            e = e+1;
            Next_state = S0;
            end
                    
            else if(Weight[i] == 2'd1)
            begin
            Weight_Index[i] = 1'b1;
            Act_element[e] = Activation[i];
            Act_Index[i] = 1'b1;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            e = e+1;
            Next_state = S0;
            end
                    
            else if(Weight[i] == 2'd0)
            begin
            Weight_Index[i] = 1'b0;
            Act_element[e] = Activation[i];
            Act_Index[i] = 1'b1;
            c = c + Act_Index[i];
            Inc_Act[i] = c;
            i = i+1;
            e = e+1;
            Next_state = S0;
            end       
                
        end          
    end
    
    else if (i==8)
    begin
    Next_state = S1;
    end
end


S1: begin
    and_op = Act_Index & Weight_Index;
    out_neuron[11:0] = 12'd10;
    i=0;
    Next_state = S2;
    end

S2:
 begin
    out_neuron[11:0] = 20 + i;
    if (i<=7)
    begin
        if(and_op[i] == 1'b1)
        begin
            if(Weight[i] == -2'd1)
            begin
            y = y - Act_element[Inc_Act[i]-1];
            i = i+1;
            Next_state = S2;
            end
            
            else
            begin
            y = y + Act_element[Inc_Act[i]-1];
            i = i+1;
            Next_state = S2;
            end
        end
        
        else if(and_op[i] == 1'b0)
        begin
        i = i+1;
        Next_state = S2;
        end
    end
    
    else if (i==8)
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
