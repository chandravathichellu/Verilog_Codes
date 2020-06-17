`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 01:51:09 PM
// Design Name: 
// Module Name: comparator
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


module comparator(output gt,input [7:0] in1,in2);
assign gt = in1[7] > in2[7] ? 1 : (in1[7] < in2[7] ?  0 : (in1[6] > in2[6] ? 1 : (in1[6] < in2[6] ? 0 : ( in1[5] > in2[5] ? 1 : (in1[5] < in2[5] ? 0 : (in1[4] > in2[4] ? 1 : (in1[4] < in2[4] ? 0 : (in1[3] > in2[3] ? 1 : (in1[3]<in2[3] ? 0 : (in1[2]>in2[2] ? 1 : (in1[2] < in2[2] ? 0 : (in1[1] > in2[1] ? 1 : (in1[1] < in2[1] ? 0 : (in1[0]>in2[0] ? 1 : 0 )))))))))))))); 
endmodule
