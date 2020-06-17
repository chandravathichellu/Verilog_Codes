`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:47:03 PM
// Design Name: 
// Module Name: gcdtb
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


module gcdtb();
reg clk=0, st=0, reset=1;
reg [7:0] A,B;
wire [7:0] a,b;
wire [1:0] sela,selb;
GCDdp datapath (a,b,gt,eq,lt,A,B,sela,selb,ld,clk,reset);
gcdcp controller (ld,done,sela,selb,gt,eq,lt,st,clk);
initial begin A=8'h70; B=8'h15; end
always #5 clk = ~clk;
initial begin #3 st=1; reset=0; end
endmodule
