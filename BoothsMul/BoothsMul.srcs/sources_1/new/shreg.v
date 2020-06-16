`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 11:42:00 AM
// Design Name: 
// Module Name: shreg
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


module shreg(output reg [15:0] out, input [15:0] in, input din,ld,shct,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset)
        out <= 0;
    else if(ld)
        out <= in;
    else if(shct)
        out <= {din,out[15:1]};
end
endmodule
