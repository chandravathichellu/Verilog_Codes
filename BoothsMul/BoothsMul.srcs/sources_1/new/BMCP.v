`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 11:53:57 AM
// Design Name: 
// Module Name: BMCP
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


module BMCP(output reg ldA,ldQ,ldM,ldcn,enct,shct,sel,done,input st,q0,qL,zero,clk);
reg [2:0] state,next_state;
parameter s0 = 3'b000, s1= 3'b001, s2 =3'b010, s3 =3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7=3'b111;
always @(posedge clk)
    state<=next_state;
always @(state,st,q0,qL,zero)
begin
    case (state)
    s0 : begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=0; if(st) next_state=s1; end 
    s1 : begin ldA=0;ldQ=1;ldM=1;ldcn=1;enct=0;shct=0;sel=0;done=0; next_state=s2; end
    s2 : begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=0; if (zero) begin done=1; next_state= s6; end else begin if(~q0 && qL) next_state=s3; else if(q0 && ~qL) next_state=s5; else next_state = s4; end end
    s3 : begin ldA=1;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=0;done=0; next_state = s4; end
    s4 : begin ldA=0;ldQ=0;ldM=0;ldcn=0;enct=1;shct=1;sel=0;done=0; next_state = s2; end
    s5 : begin ldA=1;ldQ=0;ldM=0;ldcn=0;enct=0;shct=0;sel=1;done=0; next_state = s4; end
    s6: next_state = s6;
    default : next_state= s0;
    endcase
end
endmodule
