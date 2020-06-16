`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 12:42:17 AM
// Design Name: 
// Module Name: SAAMTB
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


module SAAMTB();
reg [7:0] A,B, cnin ;
reg clk = 0, st=0, reset =1;
wire [15:0] M,addout,lrout;
wire done;
SAAMDP datapath (M,addout,lrout,gt1,eq1,lt1,gt2,eq2,lt2,reset,clk,ldA,ldB,ldM,ldct,ldlr,rshct,shct,enct,A,B,cnin);
SAAMCPN controlpath(ldA,ldB,ldM,ldct,ldlr,shct,rshct,enct,done,st,gt1,eq1,lt1,gt2,eq2,lt2,clk);
always #5 clk = ~clk;
initial 
begin
    A = 8'hed; B= 8'h23;
    #500 $finish;
end
initial begin  cnin = 0; #2 reset=0; st=1; end
endmodule
