`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 08:31:58 PM
// Design Name: 
// Module Name: csa
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


module csa( output [47:0] sum,carry, input [47:0] a,b,c );
genvar i ;
assign carry[0] = 1'b0;
generate for(i=0;i<48;i=i+1)
    fulladder fa (sum[i],carry[i+1],a[i],b[i],c[i]);
endgenerate
endmodule
