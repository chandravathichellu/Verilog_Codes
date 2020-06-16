`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 03:49:08 PM
// Design Name: 
// Module Name: wallacetree
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


module wallacetree(output [47:0] out, input [23:0] a,b);
wire [47:0] p [23:0] ;
wire [47:0] s [21:0];
wire [47:0] c [21:0];
wire carry;

assign p[0] = b[0] ? {24'b0, a} : 48'b0;
assign p[1] = b[1] ? {23'b0, a, 1'b0} : 48'b0;
assign p[2] = b[2] ? {22'b0, a, 2'b0} : 48'b0;
assign p[3] = b[3] ? {21'b0, a, 3'b0} : 48'b0;
assign p[4] = b[4] ? {20'b0, a, 4'b0} : 48'b0;
assign p[5] = b[5] ? {19'b0, a, 5'b0} : 48'b0;
assign p[6] = b[6] ? {18'b0, a, 6'b0} : 48'b0;
assign p[7] = b[7] ? {17'b0, a, 7'b0} : 48'b0;
assign p[8] = b[8] ? {16'b0, a, 8'b0} : 48'b0;
assign p[9] = b[9] ? {15'b0, a, 9'b0} : 48'b0;
assign p[10] = b[10] ? {14'b0, a, 10'b0} : 48'b0;
assign p[11] = b[11] ? {13'b0, a, 11'b0} : 48'b0;
assign p[12] = b[12] ? {12'b0, a, 12'b0} : 48'b0;
assign p[13] = b[13] ? {11'b0, a, 13'b0} : 48'b0;
assign p[14] = b[14] ? {10'b0, a, 14'b0} : 48'b0;
assign p[15] = b[15] ? {9'b0, a, 15'b0} : 48'b0;
assign p[16] = b[16] ? {8'b0, a, 16'b0} : 48'b0;
assign p[17] = b[17] ? {7'b0, a, 17'b0} : 48'b0;
assign p[18] = b[18] ? {6'b0, a, 18'b0} : 48'b0;
assign p[19] = b[19] ? {5'b0, a, 19'b0} : 48'b0;
assign p[20] = b[20] ? {4'b0, a, 20'b0} : 48'b0;
assign p[21] = b[21] ? {3'b0, a, 21'b0} : 48'b0;
assign p[22] = b[22] ? {2'b0, a, 22'b0} : 48'b0;
assign p[23] = b[23] ? {1'b0,a, 23'b0} : 48'b0;

csa cs1 (s[0],c[0],p[0],p[1],p[2]);
csa cs2 (s[1],c[1],p[3],p[4],p[5]);
csa cs3 (s[2],c[2],p[6],p[7],p[8]);
csa cs4 (s[3],c[3],p[9],p[10],p[11]);
csa cs5 (s[4],c[4],p[12],p[13],p[14]);
csa cs6 (s[5],c[5],p[15],p[16],p[17]);
csa cs7 (s[6],c[6],p[18],p[19],p[20]);
csa cs8 (s[7],c[7],p[21],p[22],p[23]);

csa cs9 (s[8],c[8],s[0],s[1],s[2]);
csa cs10 (s[9],c[9],s[3],s[4],s[5]);
csa cs11 (s[10],c[10],s[6],s[7],c[0]);
csa cs12 (s[11],c[11],c[1],c[2],c[3]);
csa cs13 (s[12],c[12],c[4],c[5],c[6]);

csa cs14 (s[13],c[13],c[7],s[8],s[9]);
csa cs15 (s[14],c[14],s[10],s[11],s[12]);
csa cs16 (s[15],c[15],c[8],c[9],c[10]);
csa cs17 (s[16],c[16],c[11],c[12],s[13]);

csa cs18 (s[17],c[17],s[14],s[15],s[16]);
csa cs19 (s[18],c[18],c[13],c[14],c[15]);
csa cs20 (s[19],c[19],c[16],s[17],s[18]);

csa cs21 (s[20],c[20],s[19],c[17],c[18]);
csa cs22 (s[21],c[21],c[19],s[20],c[20]);

rca rca1 (out,carry,s[21],c[21]);

endmodule
