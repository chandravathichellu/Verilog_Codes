`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 03:52:34 PM
// Design Name: 
// Module Name: SACPN
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


module SACPN(output reg ld,enshr,enshs,enct,done, input st,clk, zero);
reg [1:0] state,next_state;
parameter s0 = 2'b00, s1= 2'b01, s2 = 2'b10;
always @(posedge clk)
    state<=next_state;
always @(state,st,zero)
begin
    case (state)
    s0 : if(st) begin ld=1; enshr=0;enshs=0; enct=0; done=0; next_state=s1; end else next_state=s0;
    s1 :  if(~zero) begin ld=0; enshr=1;enshs=1;enct=1;done=0; next_state=s1; end else begin enshr=0;enshs=1; enct=0; done=0; next_state=s2; end
    s2 :  begin enshs=0; done=1; next_state=s2; end
    default : begin ld=0; enshr=0;enshs=0; enct=0; done=0; next_state=s0; end
    endcase
end
endmodule
