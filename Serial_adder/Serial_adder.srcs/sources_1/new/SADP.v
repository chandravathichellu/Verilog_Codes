`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 05:45:03 PM
// Design Name: 
// Module Name: SADP
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


module SADP(input [3:0] a,b, input [2:0] cntin, input ld, enshr, enshs, enct, clk, reset,cin, output [3:0] sum, output carry, zero);
wire s,ci,k;
wire [2:0] cntout;
assign carry=ci;
wire [3:0] x,y;
wire cout;
shreg sr1 (x,a,ld,enshr,clk,reset);
shreg sr2 (y,b,ld,enshr,clk,reset);
fulladder fa(s,cout,x[0],y[0],ci);
shregn sr3 (sum,s,enshs,clk,reset);
mux m1 (k,ld,cout,cin);
dff df1(ci,k,clk,reset);
cnt cnt1 (cntout,cntin,ld,enct,clk);
assign zero = ~|cntout;
endmodule
