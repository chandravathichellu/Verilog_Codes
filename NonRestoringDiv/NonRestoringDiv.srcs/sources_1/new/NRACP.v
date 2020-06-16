`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 08:36:46 PM
// Design Name: 
// Module Name: NRACP
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


module NRACP(output reg ldQ,ldM,ldA,sh,sel1,ldcn,enct,ldb,done, output reg [1:0] sel2, input st,ams,clk,zero);
reg [3:0] state,next_state;
parameter s0 = 4'b0000, s1= 4'b0001, s2 = 4'b0010, s3 =4'b0011, s4 = 4'b0100, s5 = 4'b0101, s6 = 4'b0110, s7=4'b0111,s8=4'b1000,s9=4'b1001,s10=4'b1010;
always @(posedge clk)
    state<=next_state;
always @(state,st,ams,zero)
begin
    case (state)
    s0 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; if(st) next_state=s1; end 
    s1 : begin ldQ=1;ldM=1;ldA=0;sh=0;sel1=0;sel2=0;ldcn=1;enct=0;ldb=0;done=0; next_state=s2; end
    s2 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; if(ams) next_state=s3; else next_state=s4; end
    s3: begin ldQ=0;ldM=0;ldA=0;sh=1;sel1=1;sel2=2'b10;ldcn=0;enct=0;ldb=0;done=0;  next_state=s5; end
    s4 : begin ldQ=0;ldM=0;ldA=0;sh=1;sel1=0;sel2=2'b10;ldcn=0;enct=0;ldb=0;done=0; next_state=s5; end
    s5 : begin ldQ=0;ldM=0;ldA=1;sh=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; next_state=s6; end
    s6 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=1;ldb=0;done=0; if(ams) next_state=s7; else next_state=s8; end
    s7 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=1;ldcn=0;enct=0;ldb=1;done=0; if(zero && ams) next_state=s9; else if(~zero) next_state=s2; end
    s8 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=1;done=0; if(zero && ~ams) next_state=s10; else if(~zero) next_state=s2; end
    s9 : begin ldQ=0;ldM=0;ldA=1;sh=0;sel1=1;sel2=0;ldcn=0;enct=0;ldb=0;done=0; next_state=s10; end
    s10 : begin done=1;next_state = s10; end
    default : next_state= s0;
    endcase
end
endmodule
