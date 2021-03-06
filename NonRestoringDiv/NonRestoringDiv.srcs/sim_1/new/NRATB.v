`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 09:31:30 PM
// Design Name: 
// Module Name: NRATB
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


module NRATB();
reg [7:0] Q;
reg [8:0] M;
reg [3:0] cnin ;
reg clk = 0, st=0, reset =1;
wire done;
wire [8:0] a;
wire [7:0] q;
wire [1:0] sel2;
NRADP datapath (q,a,zero,ams,Q,M,cnin,sel2,ldQ,ldM,ldA,sh,sel1,ldcn,ldb,enct,clk,reset);
NRACPN controlpath (ldQ,ldM,ldA,sh,sel1,ldcn,enct,ldb,done,sel2,st,ams,clk,zero);
always #5 clk = ~clk;
initial 
begin
    Q = 8'haf; M= 9'h009;
    #500 $finish;
end
initial begin  cnin = 4'b1000; #2 reset=0; st=1; end
endmodule
