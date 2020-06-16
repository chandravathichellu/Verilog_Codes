`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 09:30:02 PM
// Design Name: 
// Module Name: BMCPN
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


module BMCPN(output reg ldA,ldQ,ldM,ldcn,enct,shct,sel,done,input st,q0,qL,zero,clk);
reg [1:0] state,next_state;
parameter s0 = 2'b00, s1= 2'b01, s2 =2'b10, s3 =2'b11;
always @(posedge clk)
    state<=next_state;
always @(state,st,q0,qL,zero)
begin
    case (state)
    s0 : if(st) begin ldA=0;ldQ=1;ldM=1;ldcn=1;enct=0;shct=0;sel=0;done=0; next_state=s1; end 
    s1 : if (zero) begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=1; next_state= s3; end 
         else 
         begin if(~q0 && qL) begin  ldA=1;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=0; next_state=s2; end
               else if(q0 && ~qL) begin ldA=1;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=1;done=0; next_state = s2; end 
               else begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=1;shct=1;sel=0;done=0;next_state = s1; end 
         end
    s2 : begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=1;shct=1;sel=0;done=0; next_state = s1; end
    s3: next_state = s3;
    default : begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=0; next_state= s0; end
    endcase
end
endmodule
