`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 06:03:12 PM
// Design Name: 
// Module Name: FPMTBN
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


module FPMTBN();
reg [31:0] a,b;
reg clk = 0, st=0, reset =1;
wire done;
wire [31:0] fpmp;
wire [2:0] ch,sel;
FPMDPN datapath (fpmp,ch,zeroA,zeroB,check,a,b,clk,reset,ldA,ldB,ldD,ldS,ldE,ldM, ldFS, ldFE, ldFM,carryin,sel);
FPMCP controlpath (ldA,ldB,ldD,ldS,ldE,ldM,ldFS,ldFE,ldFM,done,carryin,sel,ch,zeroA,zeroB,check,st,clk);
always #5 clk = ~clk;
initial 
begin
   a = 32'hd86170d9;
   b = 32'h6189e0c4;
    #500 $finish;
end
initial begin  #2 reset=0; st=1; end
endmodule


