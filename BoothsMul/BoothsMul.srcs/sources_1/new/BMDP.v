`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 11:07:54 AM
// Design Name: 
// Module Name: BMDP
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


module BMDP(output q0,qL,zero,output [31:0] mulout,input [15:0] Q,M, input clk,reset,ldA,ldQ,ldM,ldcn,enct,shct,sel, input[4:0] cnin);
wire [15:0] a,q,A,m;
wire [4:0] cnout;
shreg sr1 (a,A,a[15],ldA,shct,clk,reset);
shreg sr2 (q,Q,a[0],ldQ,shct,clk,reset);
dff df (qL,q[0],shct,clk,reset);
piporeg pipo (m,M,ldM,clk,reset);
addsub as (A,a,m,sel);
counter cnt (cnout,cnin,ldcn,enct,clk,reset);
assign zero = ~| cnout;
assign q0 = q[0];
assign mulout = {a,q};
endmodule
