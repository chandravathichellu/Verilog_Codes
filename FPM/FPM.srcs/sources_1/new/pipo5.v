`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 12:22:59 PM
// Design Name: 
// Module Name: pipo5
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


module pipo5(output reg [22:0] out, input [22:0] in, input ld,clk,reset);
always @(posedge clk,posedge reset)
begin
    if(reset)
        out <= 0;
    else if(ld)
        out <= in;       
end
endmodule
