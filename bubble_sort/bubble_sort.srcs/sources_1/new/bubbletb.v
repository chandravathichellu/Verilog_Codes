`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 07:46:43 PM
// Design Name: 
// Module Name: bubbletb
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


module bubbletb();
reg clk=0,reset=1,st=0;
reg [7:0] IN0, IN1,IN2, IN3, IN4;
wire [7:0] OUT0, OUT1, OUT2, OUT3, OUT4;
wire done;
wire [3:0] gt;
wire [2:0] sel0,sel1,sel2,sel3,sel4;
bubbledp datapath (OUT0,OUT1,OUT2,OUT3,OUT4,gt,zero,IN0,IN1,IN2,IN3,IN4,sel0,sel1,sel2,sel3,sel4,ld,ldout,ldct,enct,clk,reset);
bubblecp controlpath (ld,ldout,ldct, enct,done,sel0,sel1,sel2,sel3,sel4,gt,zero,clk,st);
always #5 clk=~clk;
initial  begin #3 st=1;reset=0; end
initial
begin 
    IN0 = 8'h96; 
    IN1 = 8'h05; 
    IN2 = 8'h14; 
    IN3 = 8'h09; 
    IN4 = 8'h23; 
    #500 $finish;
end
endmodule
