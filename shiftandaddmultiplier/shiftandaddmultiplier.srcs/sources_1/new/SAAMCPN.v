`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 08:34:04 PM
// Design Name: 
// Module Name: SAAMCPN
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


module SAAMCPN(output reg ldA,ldB,ldM,ldct,ldlr,shct,rshct,enct,done,input st,gt1,eq1,lt1,gt2,eq2,lt2,clk);
reg [2:0] state,next_state;
parameter s0 = 3'b000, s1= 3'b001, s2 = 3'b010, s3 =3'b011, s4 = 3'b100;
always @(posedge clk)
    state<=next_state;
always @(state,st,gt1,eq2)
begin
    case (state)
    s0 : begin if(st) begin ldA=1; ldB=1;ldM=0;ldct=0;ldlr=1;shct=0;rshct=0;enct=0;done=0;next_state=s1; end else next_state=s0; end
    s1 : if(gt1 && eq2) begin ldA=0; ldB=0;ldM=0;ldct=0;ldlr=0;shct=1;rshct=0;enct=0;done=0; next_state=s2; end 
         else if (gt1 && ~eq2) begin ldA=0; ldB=0;ldM=0;ldct=0;ldlr=0;shct=0;rshct=1;enct=1;done=0; next_state = s1;  end 
         else if(~gt1) begin ldA=0; ldB=0;ldM=0;ldct=0;ldlr=0;shct=0;rshct=0;enct=0;done=1;next_state = s4; end
    s2 : begin ldA=0; ldB=0;ldM=1;ldct=0;ldlr=0;shct=0;rshct=0;enct=0;done=0; next_state= s3; end 
    s3 : begin ldA=0; ldB=0;ldM=0;ldct=0;ldlr=0;shct=0;rshct=1;enct=1;done=0; next_state = s1; end
    s4: next_state = s4;
    default : begin ldA=0; ldB=0;ldM=0;ldct=0;ldlr=0;shct=0;rshct=0;enct=0;done=0; next_state= s0; end
    endcase
end
endmodule
