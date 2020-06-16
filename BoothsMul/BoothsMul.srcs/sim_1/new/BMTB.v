`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 12:08:50 PM
// Design Name: 
// Module Name: BMTB
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


module BMTB();
reg [15:0] Q,M;
reg [4:0] cnin ;
reg clk = 0, st=0, reset =1;
wire done;
wire [31:0] mulout;
BMDP datapath (q0,qL,zero,mulout,Q,M,clk,reset,ldA,ldQ,ldM,ldcn,enct,shct,sel,cnin);
BMCPN controlpath(ldA,ldQ,ldM,ldcn,enct,shct,sel,done,st,q0,qL,zero,clk);
always #5 clk = ~clk;
initial 
begin
    Q = 16'he456; M= 16'h0ced;
    #500 $finish;
end
initial begin  cnin = 5'b10000; #2 reset=0; st=1; end
endmodule
