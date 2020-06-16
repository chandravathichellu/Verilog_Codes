`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 07:15:45 PM
// Design Name: 
// Module Name: SACP
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


module SACP(output reg ld,ensh,enct,done, input st,clk, zero);
reg [1:0] state;
parameter s0 = 2'b00, s1= 2'b01, s2 = 2'b10, s3 =2'b11;
always @(posedge clk)
begin
    case (state)
    s0 : if(st) state<=s1;
    s1 : state<=s2; 
    s2 : if(zero) state<=s3;
    s3 : state<=s3;
    default :  state<=s0;
    endcase
end
always @(state)
begin
    case (state)
    s0 : begin ld=0; ensh=0; enct=0; done=0; end 
    s1 : begin ld=1; ensh=0; enct=0; done=0; end
    s2 : begin ld=0;ensh=1;enct=1;done=0; end 
    s3 : begin ld=0; ensh=0; enct=0; done=1; end
    default : begin ld=0; ensh=0; enct=0; done=0; end
    endcase
end
endmodule