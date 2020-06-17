`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 12:25:41 PM
// Design Name: 
// Module Name: bubbledp
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

module bubbledp(output [7:0] OUT0,OUT1,OUT2,OUT3,OUT4, output [3:0] gt, output zero, input [7:0] IN0,IN1,IN2,IN3,IN4, input [2:0] sel0,sel1,sel2,sel3,sel4, input ld,ldout,ldct,enct,clk,reset);
wire [7:0] in0,in1,in2,in3,in4,muxout0,muxout1,muxout2,muxout3,muxout4;
wire [2:0] cntin=3'b100;
wire [2:0] cntout;
shreg shreg1 (in0,IN0,ld,clk,reset);
shreg shreg2 (in1,IN1,ld,clk,reset);
shreg shreg3 (in2,IN2,ld,clk,reset);
shreg shreg4 (in3,IN3,ld,clk,reset);
shreg shreg5 (in4,IN4,ld,clk,reset);
shreg shreg6 (OUT0,muxout0,ldout,clk,reset);
shreg shreg7 (OUT1,muxout1,ldout,clk,reset);
shreg shreg8 (OUT2,muxout2,ldout,clk,reset);
shreg shreg9 (OUT3,muxout3,ldout,clk,reset);
shreg shreg10 (OUT4,muxout4,ldout,clk,reset);
mux mux1 (muxout0, sel0, in0,OUT0,OUT1,OUT2,OUT3,OUT4,0,0);
mux mux2 (muxout1, sel1, in1,OUT0,OUT1,OUT2,OUT3,OUT4,0,0);
mux mux3 (muxout2, sel2, in2,OUT0,OUT1,OUT2,OUT3,OUT4,0,0);
mux mux4 (muxout3, sel3, in3,OUT0,OUT1,OUT2,OUT3,OUT4,0,0);
mux mux5 (muxout4, sel4, in4,OUT0,OUT1,OUT2,OUT3,OUT4,0,0);
comparator comp1 (gt[3],OUT0,OUT1);
comparator comp2 (gt[2],OUT1,OUT2);
comparator comp3 (gt[1],OUT2,OUT3);
comparator comp4 (gt[0],OUT3,OUT4);
counter cnt(cntout,cntin,ldct,enct,clk,reset);
assign zero = ~|cntout; 
endmodule
