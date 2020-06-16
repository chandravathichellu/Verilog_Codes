`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2020 11:58:39 AM
// Design Name: 
// Module Name: pipo
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


module pipo(output reg [32:0] out,input [32:0] in, input ld,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset)
        out <= 0;
    else if(ld)
        out <= in;
end
endmodule