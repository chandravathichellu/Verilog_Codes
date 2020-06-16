`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 11:17:09 PM
// Design Name: 
// Module Name: NRACPN
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


module NRACPN(output reg ldQ,ldM,ldA,sh,sel1,ldcn,enct,ldb,done, output reg [1:0] sel2, input st,ams,clk,zero);
reg [2:0] state,next_state;
parameter s0 = 3'b000, s1= 3'b001, s2 = 3'b010, s3 =3'b011, s4 = 3'b100;
always @(posedge clk)
    state<=next_state;
always @(state,st,ams,zero)
begin
    case (state)
    s0 : if(st) begin ldQ=1;ldM=1;ldA=0;sh=0;sel1=0;sel2=0;ldcn=1;enct=0;ldb=0;done=0; next_state=s1; end else next_state=s0;
    s1 : if(~zero && ams) begin ldQ=0;ldM=0;ldA=0;sh=1;sel1=1;sel2=2'b10;ldcn=0;enct=0;ldb=0;done=0; next_state=s2; end 
         else if(~zero && ~ams)  begin  ldQ=0;ldM=0;ldA=0;sh=1;sel1=0;sel2=2'b10;ldcn=0;enct=0;ldb=0;done=0; next_state=s2; end
         else if(zero && ams) begin ldQ=0;ldM=0;ldA=1;sh=0;sel1=1;sel2=0;ldcn=0;enct=0;ldb=0;done=0; next_state=s4;  end 
         else if(zero && ~ams) begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0;next_state = s4; end 
    s2 : begin ldQ=0;ldM=0;ldA=1;sh=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0; next_state=s3; end
    s3 :  if(ams) begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=1;ldcn=0;enct=1;ldb=1;done=0; next_state=s1; end
          else begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=1;ldb=1;done=0; next_state=s1; end       
    s4 : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=1;next_state = s4; end
    default : begin ldQ=0;ldM=0;ldA=0;sh=0;sel1=0;sel2=0;ldcn=0;enct=0;ldb=0;done=0;next_state= s0; end
    endcase
end
endmodule
