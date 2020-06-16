`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 10:58:51 PM
// Design Name: 
// Module Name: comp1
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


module comp1(output reg gt,eq,lt, input [7:0] in1,in2);
always @(*)
begin
    gt = 0;
    eq = 0;
    lt = 0;
    if(in1 > in2)
        gt = 1;
    else if(in1 < in2)
        lt = 1;
    else
        eq = 1;
end
endmodule
