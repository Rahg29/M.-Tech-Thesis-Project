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


module CNN_MUL_Parallel(
input clk,
output reg signed [11:0] OR1_0, OR1_1, OR1_2, OR1_3, OR1_4, OR1_5, OR1_6, OR1_7, OR1_8,
output reg signed [11:0] OR2_0, OR2_1, OR2_2, OR2_3, OR2_4, OR2_5, OR2_6, OR2_7, OR2_8

);
    
reg signed [8:0] A0[0:4], A1[0:4], A2[0:4], A3[0:4], A4[0:4] ;
reg signed [1:0] W1 [0:8] ;
reg signed [1:0] W2 [0:8] ;
reg signed [8:0] Act [0:8] ;

reg signed [11:0] ACC_1 [0:8] ;
reg signed [11:0] ACC_2 [0:8] ;

reg [3:0] W1_P [0:1] ;
reg [3:0] W1_N [0:1] ;
reg [3:0] W2_P [0:1] ;
reg [3:0] W2_N [0:1] ;

integer i=0, c=0, j=0, Sum1=0, Sum2=0, reset=1; 

reg [3:0] Pres_state;
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
parameter cal=4'd10;
//parameter cmp=4'd11;

    
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

S0:begin

reset=0;

$readmemb("A0.mif", A0);
$readmemb("A1.mif", A1);
$readmemb("A2.mif", A2);
$readmemb("A3.mif", A3);
$readmemb("A4.mif", A4);

$readmemb("W1.mif", W1);
$readmemb("W2.mif", W2);

Next_state = S1;

end

cal:
begin
    
    ACC_1[0]= Act[0] * W1[0];
    ACC_1[1]= Act[1] * W1[1];
    ACC_1[2]= Act[2] * W1[2];
    ACC_1[3]= Act[3] * W1[3];
    ACC_1[4]= Act[4] * W1[4];
    ACC_1[5]= Act[5] * W1[5];
    ACC_1[6]= Act[6] * W1[6];
    ACC_1[7]= Act[7] * W1[7];
    ACC_1[8]= Act[8] * W1[8];
        
    ACC_2[0]= Act[0] * W2[0];
    ACC_2[1]= Act[1] * W2[1];
    ACC_2[2]= Act[2] * W2[2];
    ACC_2[3]= Act[3] * W2[3];
    ACC_2[4]= Act[4] * W2[4];
    ACC_2[5]= Act[5] * W2[5];
    ACC_2[6]= Act[6] * W2[6];
    ACC_2[7]= Act[7] * W2[7];
    ACC_2[8]= Act[8] * W2[8];

    c=c+1;
        
    if (c == 1)
        Next_state = S1;
    
    else if (c == 2)
        Next_state = S2;
    
    else if (c == 3)
        Next_state = S3;
    
    else if (c == 4)
        Next_state = S4;
    
    else if (c == 5)
        Next_state = S5;
    
    else if (c == 6)
        Next_state = S6;
    
    else if (c == 7)
        Next_state = S7;
    
    else if (c == 8)
        Next_state = S8;
    
    else if (c == 9)
        Next_state = S9;

end

S1:
begin
    //OR1_0 = i;
    if(j <= 2 && i == 0)
        begin
        
        Act[j] = A0[j];
        Act[j+3] = A1[j];
        Act[j+6] = A2[j];
        //Act[j+12] = A3[j];
        j=j+1;
        Next_state = S1;
        end
    else if ( j == 3 && i == 0)
        begin
        j=4;
        Next_state = cal;
        end
            
    else if (i <= 8 && j==4 )
        begin
        Sum1 = ACC_1[i] + Sum1;
        Sum2 = ACC_2[i] + Sum2;
        i=i+1;
        Next_state = S1;
        end 
    
    else if(i == 9)        
        begin
        OR1_0 = Sum1 ;
        OR2_0 = Sum2 ;
        Sum1=0;
        Sum2=0;
        i=0;
        j=0;    
        Next_state = S2;
        end    

end


S2: 
begin
    //OR1_0 = i+100;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A0[j+1];
        Act[j+3] = A1[j+1];
        Act[j+6] = A2[j+1];
        //Act[j+12] = A3[j+1];
        j=j+1;
        Next_state = S2;
        end
            
    else if ( j == 3 && i == 0)
            begin
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S2;
            end 
            
    else if(i == 9)        
        begin
        OR1_1 = Sum1 ;
        OR2_1 = Sum2 ;
        Sum1=0;
        Sum2=0;
        i=0;
        j=0;    
        Next_state = S3;
        end    
    
end

S3:
begin
    //OR1_0 = i+200;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A0[j+2];
        Act[j+3] = A1[j+2];
        Act[j+6] = A2[j+2];
        //Act[j+12] = A4[j];
        j=j+1;
        Next_state = S3;
        end
            
        else if ( j == 3 && i == 0)
            begin
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S3;
            end 
            
    else if(i == 9)        
        begin
        OR1_2 = Sum1 ;
        OR2_2 = Sum2 ;
        Sum1=0;
        Sum2=0;
        i=0;
        j=0;    
        Next_state = S4;
        end    
    
end

S4:
begin
    //OR1_0 = i+300;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A1[j];
        Act[j+3] = A2[j];
        Act[j+6] = A3[j];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S4;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S4;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_3 = Sum1 ;
        OR2_3 = Sum2 ;
        Sum1=0;
        Sum2=0;
        i=0;
        j=0;
        Next_state = S5;
        end    
    
end

S5:
begin
    //OR1_0=i+400;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A1[j+1];
        Act[j+3] = A2[j+1];
        Act[j+6] = A3[j+1];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S5;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S5;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_4 = Sum1;
        OR2_4 = Sum2;
        Sum1=0;
        Sum2=0;
            
        i=0;
        j=0;    
        Next_state = S6;
        end    
end

S6:
begin
    //OR1_0=i+500;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A1[j+2];
        Act[j+3] = A2[j+2];
        Act[j+6] = A3[j+2];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S6;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S6;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_5 = Sum1 ;
        OR2_5 = Sum2 ;
        Sum1=0;
        Sum2=0;
            
        i=0;
        j=0;    
        Next_state = S7;
        end    

end

S7:
begin
    //OR1_0=i+600;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A2[j];
        Act[j+3] = A3[j];
        Act[j+6] = A4[j];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S7;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S7;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_6 = Sum1 ;
        OR2_6 = Sum2 ;
        Sum1=0;
        Sum2=0;
            
        i=0;
        j=0;    
        Next_state = S8;
        end    

end

S8:
begin
    //OR1_0=i+400;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A2[j+1];
        Act[j+3] = A3[j+1];
        Act[j+6] = A4[j+1];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S8;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S8;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_7 = Sum1 ;
        OR2_7 = Sum2 ;
        Sum1=0;
        Sum2=0;
            
        i=0;
        j=0;    
        Next_state = S9;
        end    

end

S9:
begin
    //OR1_0=i+400;
    if(j <= 2 && i == 0)
        begin
        Act[j] = A2[j+2];
        Act[j+3] = A3[j+2];
        Act[j+6] = A4[j+2];
        //Act[j+12] = A4[j+1];
        j=j+1;
        Next_state = S9;
        end
            
        else if ( j == 3 && i == 0)
            begin
            
            j=4;
            Next_state = cal;
            end
                
        else if (i <= 8 && j==4 )
            begin
            Sum1 = ACC_1[i] + Sum1;
            Sum2 = ACC_2[i] + Sum2;
            i=i+1;
            Next_state = S9;
            end 
        
    
    else if (i == 9)        
        begin
        OR1_8 = Sum1 ;
        OR2_8 = Sum2 ;
        Sum1=0;
        Sum2=0;
            
        i=i+1;
        end    

    
end



endcase
end


endmodule
