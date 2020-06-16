`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 02:49:56 PM
// Design Name: 
// Module Name: RACP
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


module RACP(output reg ldQ,ldM,ldA,ldd,sh,sel1,ldcn,enct,ldb,done, output reg [1:0] sel2, input st,ams,clk,zero);
reg [2:0] state,next_state;
parameter s0 = 3'b000, s1= 3'b001, s2 = 3'b010, s3 =3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7=3'b111;
always @(posedge clk)
    state<=next_state;
always @(state,st,ams,zero)
begin
    case (state)
    s0 : begin ldQ=0;ldM=0;ldA=0;ldd=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; if(st) next_state=s1; end 
    s1 : begin ldQ=1;ldM=1;ldA=0;ldd=0;sh=0;sel1=0;sel2=0;ldcn=1;enct=0;ldb=0;done=0; next_state=s2; end
    s2 : begin ldQ=0;ldM=0;ldA=0;ldd=0;sh=1;sel1=0;sel2=2'b10;ldcn=0;enct=0;ldb=0;done=0; next_state=s3; end
    s3: begin ldQ=0;ldM=0;ldA=1;ldd=1;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; next_state=s4; end
    s4 : begin ldQ=0;ldM=0;ldA=0;ldd=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=1;ldb=0;done=0; if (ams) next_state=s5; else next_state=s6; end 
    s5 : begin ldQ=0;ldM=0;ldA=1;ldd=0;sh=0;sel1=1;sel2=0;ldcn=0;enct=0;ldb=1;done=0; if(zero)begin next_state=s7;end else next_state = s2; end
    s6 : begin ldQ=0;ldM=0;ldA=0;ldd=0;sh=0;sel1=0;sel2=2'b01;ldcn=0;enct=0;ldb=1;done=0; if(zero) begin next_state=s7; end else next_state = s2; end
    s7: begin done=1;next_state = s7; end
    default : next_state= s0;
    endcase
end
endmodule
