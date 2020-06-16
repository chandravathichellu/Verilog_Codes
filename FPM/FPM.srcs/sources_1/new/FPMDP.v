`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 03:42:15 PM
// Design Name: 
// Module Name: FPMDP
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


module FPMDP(output [31:0] fpmo, input [31:0] a,b, input clk,reset);
wire [7:0] exa, exb;
wire [23:0] ma,mb;
wire signa,signb,signo;
wire [47:0] prod; 
wire carry;
assign exa=a[30:23];
assign exb=b[30:23];
assign ma = {1'b1,a[22:0]};
assign mb = {1'b1,b[22:0]};
assign signa = a[31];
assign signb = b[31];
wallacetree wat (prod,carry,ma,mb);
rng round (fpmo,signa,signb,exa,exb,prod);
endmodule
