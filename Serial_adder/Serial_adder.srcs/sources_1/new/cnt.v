`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 06:33:22 PM
// Design Name: 
// Module Name: cnt
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


module cnt(output reg [2:0] cntout,input [2:0] cntin, input ld,enct,clk);
always @(posedge clk)
begin
    if (ld) cntout <= cntin;
    else if (enct) cntout <= cntout-1;
end
endmodule
