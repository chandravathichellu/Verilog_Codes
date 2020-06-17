`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:09:07 PM
// Design Name: 
// Module Name: GCDdp
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


module GCDdp(output [7:0] a,b, output gt,eq,lt, input [7:0] A,B, input [1:0] sela,selb, input ld,clk,reset);
wire [7:0] muxa,muxb,suba,subb;
shreg shreg1 (a,muxa,ld,clk,reset);
shreg shreg2 (b,muxb,ld,clk,reset);
comparator comp (gt,eq,lt,a,b);
mux mux1(muxa, sela, A,a, suba);
mux mux2(muxb, selb, B,b, subb);
sub sub1 (suba, a,b);
sub sub2 (subb, b,a);
endmodule
