`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2018 17:14:33
// Design Name: 
// Module Name: CNN_Comp_Parallel
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


module CNN_Comp_Parallel(
//input signed [8:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
//                  a21, a22, a23, a24,
//input signed [1:0] w1_0, w1_1, w1_2, w1_3, w1_4, w1_5, w1_6, w1_7, w1_8, 
//input signed [1:0] w2_0, w2_1, w2_2, w2_3, w2_4, w2_5, w2_6, w2_7, w2_8, 
input clk,
output reg signed [11:0] OR1_0, OR1_1, OR1_2, OR1_3, OR1_4, OR1_5, OR1_6, OR1_7, OR1_8,
output reg signed [11:0] OR2_0, OR2_1, OR2_2, OR2_3, OR2_4, OR2_5, OR2_6, OR2_7, OR2_8

);
    
reg signed [8:0] A0[0:4], A1[0:4], A2[0:4], A3[0:4], A4[0:4] ;
reg signed [1:0] W1 [0:8] ;
reg signed [1:0] W2 [0:8] ;
reg signed [8:0] Act [0:8] ;

reg [3:0] W1_P [0:1] ;
reg [3:0] W1_N [0:1] ;
reg [3:0] W2_P [0:1] ;
reg [3:0] W2_N [0:1] ;

integer i=0, j=0, Sum1=0, Sum2=0, Sum3=0, Sum4=0, reset=1, 
        I1=0, I2=0; 

reg [3:0]Pres_state;
reg [3:0] Next_state;

parameter S0=4'd0;
parameter S1=4'd1;
parameter S2=4'd2;
parameter S3=4'd3;
parameter S4=4'd4;
parameter S5=4'd5;
parameter S6=4'd6;
parameter S7=4'd7;
parameter S8=4'd8;
parameter S9=4'd9;
parameter S10=4'd10;
parameter S11=4'd11;

always @(posedge clk)
begin
    if (reset == 1'd1)
    Pres_state = S0;
    
    else
    Pres_state = Next_state;
end

always @(posedge clk)
begin

case(Pres_state)

S0: begin

reset =0;

//OR1_3=5;

$readmemb("A0.mif", A0);
$readmemb("A1.mif", A1);
$readmemb("A2.mif", A2);
$readmemb("A3.mif", A3);
$readmemb("A4.mif", A4);

$readmemb("W1.mif", W1);
$readmemb("W2.mif", W2);


Next_state = S1;
end

S1:begin
//OR1_3=A0[3];
if (i <= 8)
    begin
    if (W1[i] == 2'd1)
        begin
        W1_P [I1] = i;
        I1 = I1 + 1;
        i = i + 1;
        Next_state = S1;
        end
    else if (W1[i] == -2'd1)
        begin
        W1_N [I2] = i;
        I2 = I2 + 1;
        i = i + 1;
        Next_state = S1;
        end
    else
        begin
        i = i + 1;
        Next_state = S1;
        end 
end

else 
begin
i=0;
I1=0;
I2=0;
Next_state = S2;
end
end

S2:begin
//OR1_3= i+50;
if (i <= 8)
    begin
    if (W2[i] == 2'd1)
        begin
        W2_P [I1] = i;
        I1 = I1 + 1;
        i = i + 1;
        Next_state = S2;
        end
    else if (W2[i] == -2'd1)
        begin
        W2_N [I2] = i;
        I2 = I2 + 1;
        i = i + 1;
        Next_state = S2;
        end
    else
        begin
        i = i + 1;
        Next_state = S2;
        end
    end
    
else
begin
i=0;
I1=0;
I2=0;
Next_state = S3;
end
end


S3:
begin
    //OR1_3=i+100;
    if(j <= 2)
        begin
        Act[j] = A0[j];
        Act[j+3] = A1[j];
        Act[j+6] = A2[j];
        //Act[j+12] = A3[j];
        j=j+1;
        Next_state = S3;
        end
            
    else if (i <= 1 )
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S3;
        end
    
    else if(i == 2)        
        begin
        OR1_0 = Sum1 + Sum2 ;
        OR2_0 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;
        i=0;
        j=0;    
        Next_state = S4;
        end    

end


S4: 
begin
    //OR1_3=i+200;
    if(j <= 2)
        begin
        Act[j] = A0[j+1];
        Act[j+3] = A1[j+1];
        Act[j+6] = A2[j+1];
        //Act[j+12] = A3[j+1];
        j=j+1;
        Next_state = S4;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S4;
        end
    
    else if(i == 2)        
        begin
        OR1_1 = Sum1 + Sum2 ;
        OR2_1 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;
        i=0;
        j=0;    
        Next_state = S5;
        end    
    
end

S5:
begin
    //OR1_3=i+300;
    if(j <= 2)
        begin
        Act[j] = A0[j+2];
        Act[j+3] = A1[j+2];
        Act[j+6] = A2[j+2];
        j=j+1;
        Next_state = S5;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S5;
        end
    
    else if(i == 2)        
        begin
        OR1_2 = Sum1 + Sum2 ;
        OR2_2 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;
        i=0;
        j=0;    
        Next_state = S6;
        end    
    
end

S6:
begin
    //OR1_3=i+400;
    if(j <= 2)
        begin
        Act[j] = A1[j];
        Act[j+3] = A2[j];
        Act[j+6] = A3[j];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S6;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S6;
        end
    
    else if (i == 2)        
        begin
        OR1_3 = Sum1 + Sum2 ;
        OR2_3 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=0;
        j=0;    
        Next_state = S7;
        end    
end

S7:
begin
    //OR1_3=i+400;
    if(j <= 2)
        begin
        Act[j] = A1[j+1];
        Act[j+3] = A2[j+1];
        Act[j+6] = A3[j+1];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S7;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S7;
        end
    
    else if (i == 2)        
        begin
        OR1_4 = Sum1 + Sum2 ;
        OR2_4 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=0;
        j=0;    
        Next_state = S8;
        end    
end

S8:
begin
    //OR1_0=i+400;
    if(j <= 2)
        begin
        Act[j] = A1[j+2];
        Act[j+3] = A2[j+2];
        Act[j+6] = A3[j+2];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S8;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S8;
        end
    
    else if (i == 2)        
        begin
        OR1_5 = Sum1 + Sum2 ;
        OR2_5 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=0;
        j=0;    
        Next_state = S9;
        end    

end

S9:
begin
    //OR1_0=i+400;
    if(j <= 2)
        begin
        Act[j] = A2[j];
        Act[j+3] = A3[j];
        Act[j+6] = A4[j];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S9;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S9;
        end
    
    else if (i == 2)        
        begin
        OR1_6 = Sum1 + Sum2 ;
        OR2_6 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=0;
        j=0;    
        Next_state = S10;
        end    

end

S10:
begin
    //OR1_0=i+400;
    if(j <= 2)
        begin
        Act[j] = A2[j+1];
        Act[j+3] = A3[j+1];
        Act[j+6] = A4[j+1];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S10;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S10;
        end
    
    else if (i == 2)        
        begin
        OR1_7 = Sum1 + Sum2 ;
        OR2_7 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=0;
        j=0;    
        Next_state = S11;
        end    

end

S11:
begin
    //OR1_0=i+400;
    if(j <= 2)
        begin
        Act[j] = A2[j+2];
        Act[j+3] = A3[j+2];
        Act[j+6] = A4[j+2];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S11;
        end
            
    else if (i <= 1)
        begin
        Sum1 = Act[W1_P [i]] + Sum1;
        Sum2 = (-Act[W1_N [i]]) + Sum2;
        Sum3 = Act[W2_P [i]] + Sum3;
        Sum4 = (-Act[W2_N [i]]) + Sum4;
        i=i+1;
        Next_state = S11;
        end
    
    else if (i == 2)        
        begin
        OR1_8 = Sum1 + Sum2 ;
        OR2_8 = Sum3 + Sum4 ;
        Sum1=0;
        Sum2=0;
        Sum3=0;
        Sum4=0;    
        i=i+1;
        end    

    
end

endcase
end


endmodule
