`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 02:46:39 PM
// Design Name: 
// Module Name: mux2
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


module mux2(output reg out, input [1:0] sel, input in0,in1,in2,in3);
always @(*)
begin
    if(sel==0)
        out = in0;
    else if(sel==1)
        out = in1;
    else if (sel==2)
        out = in2;
    else
        out =in3;
end
endmodule
