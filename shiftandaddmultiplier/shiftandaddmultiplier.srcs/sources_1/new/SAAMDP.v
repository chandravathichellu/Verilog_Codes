`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 09:15:13 PM
// Design Name: 
// Module Name: SAAMDP
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


module SAAMDP(output [15:0]M, addout,lrout, output gt1,eq1,lt1,gt2,eq2,lt2, input reset,clk,ldA,ldB,ldM,ldct,ldlr,rshct,shct,enct,input [7:0] A,B,cnin);
wire [7:0] X,Y,cnout;
wire [15:0] lrin;
usreg pr1 (X,A,ldA,rshct,clk,reset);
piporeg1 pr2 (Y,B,ldB,clk,reset);
piporeg2 pr3 (M,addout,ldM,clk,reset);
assign lrin = {8'b0,B};
lsreg ls1 (lrout,lrin,cnout,ldlr,shct,clk,reset);
comp1 c1 (gt1,eq1,lt1,X,0);
comp2 c2 (gt2,eq2,lt2,X[0],1);
counter cn (cnout,cnin,ldct,enct,clk,reset);
adder add (addout,lrout,M);
endmodule
