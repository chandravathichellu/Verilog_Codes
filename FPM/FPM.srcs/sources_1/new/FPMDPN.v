`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 11:38:11 AM
// Design Name: 
// Module Name: FPMDPN
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


module FPMDPN(output [31:0] fpmp, output [2:0] ch,  output zeroA,zeroB,check, input [31:0] a,b, input clk,reset,ldA,ldB,ldD,ldS,ldE,ldM, ldFS, ldFE, ldFM,carryin, input [2:0] sel);
wire [31:0] A,B;
wire signA,signB,signo;
wire [7:0] expA,expB;
wire [23:0] mA,mB;
wire [22:0] mano;
wire carryo;
wire [7:0] ina,inb,addo;
wire [47:0] product;
pipo1 pp1 (A,a,ldA,clk,reset);
pipo1 pp2 (B,b,ldB,clk,reset);
assign zeroA = ~| A;
assign zeroB = ~| B;
pipo2 pp3 (signA,A[31],ldS,clk,reset); 
pipo2 pp4 (signB,B[31],ldS,clk,reset);
pipo3 pp5 (expA,A[30:23],ldE,clk,reset);
pipo3 pp6 (expB,B[30:23],ldE,clk,reset);
pipo4 pp7 (mA,{1'b1,A[22:0]},ldM,clk,reset);
pipo4 pp8 (mB,{1'b1,B[22:0]},ldM,clk,reset);
assign signo = signA ^ signB;
pipo2 pp9 (fpmp[31],signo,ldFS,clk,reset); 
mux mx(inb,sel,expA,expB,8'b01111111,8'b00000001,8'b0);
adder add (addo, carryo, ina,inb,carryin);
pipo3 pp10 (ina,addo,ldD,clk,reset);
assign check=(expA[7] & expB[7] & ~ina[7]) | (~expA[7] & ~expB[7] & ina[7]);
wallacetree wat (product,mA,mB);
assign ch = product[47:45];
pipo3 pp11 (fpmp[30:23],ina,ldFE,clk,reset);
mantf msf (mano,ch,product);
pipo5 pp12 (fpmp[22:0],mano,ldFM,clk,reset); 
endmodule
