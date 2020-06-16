`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2020 11:46:43 AM
// Design Name: 
// Module Name: MACTB
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


module MACTB();
reg [15:0] Q,M;
reg [4:0] cnin ;
reg clk = 0, st=0, reset =1;
wire done;
wire [32:0] macout;
MACDP datapath (q0,qL,zero,macout,Q,M,clk,reset,ldr,ldA,ldQ,ldM,ldcn,enct,shct,sel,cnin);
MACCP controlpath(ldr,ldA,ldQ,ldM,ldcn,enct,shct,sel,done,st,q0,qL,zero,clk);
always #5 clk = ~clk;
initial 
begin
    Q = 16'h79ed; M= 16'h5dce;
    #400 $finish;
end
initial begin  cnin = 5'b10000; #2 reset=0; st=1; end
endmodule
