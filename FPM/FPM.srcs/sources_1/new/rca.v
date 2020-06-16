`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 06:21:14 PM
// Design Name: 
// Module Name: rca
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


module rca( output [47:0] sum, output carry, input [47:0] a,b );
genvar i ;
wire c[47:0];
assign c[0] = 1'b0;
generate for(i=0;i<48;i=i+1)
    fulladder fa (sum[i],c[i+1],a[i],b[i],c[i]);
endgenerate
assign carry = c[47];
endmodule
