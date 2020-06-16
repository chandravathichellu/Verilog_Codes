`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 11:02:53 PM
// Design Name: 
// Module Name: comp2
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


module comp2(output reg gt,eq,lt, input in1,in2);
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
