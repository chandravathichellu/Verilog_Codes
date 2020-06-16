`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 04:50:18 PM
// Design Name: 
// Module Name: SACATEST
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


module SACATEST(output reg ld,ensh,enct,done, input st,clk, zero);
reg [1:0] state,next_state;
parameter s0 = 2'b00, s1= 2'b01, s2 = 2'b10, s3 =2'b11;
always @(posedge clk)
    state<=next_state;
always @(state,st,zero)
begin
    case (state)
    s0 : begin ld=0; ensh=0; enct=0; done=0; if(st) next_state=s1; end 
    s1 : begin ld=1; ensh=0; enct=0; done=0; next_state=s2; end
    s2 : begin ld=0;ensh=1;enct=1;done=0; if(zero) next_state=s3; end 
    s3 : begin ld=0; ensh=0; enct=0; done=1; next_state=s3; end
    default : next_state=s0;
    endcase
end
endmodule