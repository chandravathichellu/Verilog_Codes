`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:29:53 PM
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


module shreg(output reg [7:0] out, input [7:0] in, input ld,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset) out <= 0;
    else if(ld) out <= in;
end
endmodule
