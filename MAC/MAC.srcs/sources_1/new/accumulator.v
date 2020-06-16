`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2020 12:00:00 PM
// Design Name: 
// Module Name: accumulator
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


module accumulator(output [31:0] accout, output cout, input [31:0] a,b, input cin);
genvar i; 
wire c[32:0];
assign c[0] = cin;
assign cout = c[32];
generate for(i=0;i<32;i=i+1)
begin
    fulladder fa(accout[i],c[i+1],a[i],b[i],c[i]);
end
endgenerate
endmodule
