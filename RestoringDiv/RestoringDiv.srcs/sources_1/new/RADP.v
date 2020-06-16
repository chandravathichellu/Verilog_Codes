`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 02:13:27 PM
// Design Name: 
// Module Name: RADP
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


module RADP(output [7:0] q, output [8:0] a,output zero,ams,input [7:0] Q, input [8:0] M, input [3:0] cnin, input [1:0] sel2, input ldQ,ldM,ldA,ldd,sh,sel1,ldcn,ldb,enct,clk,reset);
wire [8:0] A,in1,in2,m;
wire [3:0] cnout;
shreg sr1 (a,A,q[7],ldA,sh,clk,reset);
shregn sr2 (q,Q,din,ldQ,sh,ldb,clk,reset);
piporeg pipo1 (m,M,ldM,clk,reset);
sub su (in1,a,m);
piporeg pipo2 (in2,a,ldd,clk,reset);
mux1 mu1 (A,sel1,in1,in2);
mux2 mu2 (din,sel2,0,1,Z,Z);
count cnt (cnout,cnin,ldcn,enct,clk,reset);
assign zero = ~| cnout;
assign ams=a[8];
endmodule
