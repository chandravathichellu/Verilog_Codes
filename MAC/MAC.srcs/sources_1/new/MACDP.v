`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2020 11:42:55 AM
// Design Name: 
// Module Name: MACDP
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


module MACDP(output q0,qL,zero,output [32:0] macout,input [15:0] Q,M, input clk,reset,ldr,ldA,ldQ,ldM,ldcn,enct,shct,sel, input[4:0] cnin);
wire [15:0] a,q,A,m;
wire [4:0] cnout;
wire [31:0] mulout,accout;
shreg sr1 (a,A,a[15],ldA,shct,clk,reset);
shreg sr2 (q,Q,a[0],ldQ,shct,clk,reset);
dff df (qL,q[0],shct,clk,reset);
piporeg pipo1 (m,M,ldM,clk,reset);
addsub as (A,a,m,sel);
counter cnt (cnout,cnin,ldcn,enct,clk,reset);
assign zero = ~| cnout;
assign q0 = q[0];
assign mulout = {a,q};
accumulator acc (accout,cout,mulout,macout[31:0],macout[32]);
pipo pp (macout,{cout,accout},ldr,clk,reset);
endmodule

