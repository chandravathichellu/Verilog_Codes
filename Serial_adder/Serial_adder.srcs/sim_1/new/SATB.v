`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 09:24:47 PM
// Design Name: 
// Module Name: SATB
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


module SATB();
reg [3:0] a,b ;
reg [2:0] cntin;
reg cin;
reg clk = 0, st=0, reset =1;
wire [3:0] sum;
wire carry, done;
SADP datapath (a, b,cntin, ld, enshr,enshs, enct, clk,reset,cin, sum,carry, zero);
SACPN controlpath (ld,enshr,enshs,enct,done, st,clk, zero);
always #5 clk = ~clk;
initial 
begin
    a = 4'b1010; b=  4'b1111;
    #300 $finish;
end
initial begin  cin=1;cntin = 3'b011; #2 reset=0; st=1; end
endmodule
