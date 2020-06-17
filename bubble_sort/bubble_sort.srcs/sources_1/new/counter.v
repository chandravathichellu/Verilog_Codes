`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 07:37:16 PM
// Design Name: 
// Module Name: counter
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


module counter(output reg [2:0] cntout, input [2:0] cntin, ld, enct, clk, reset);
always @(posedge clk, posedge reset)
begin   
    if(reset) cntout <= 0;
    else if(ld) cntout <= cntin;
    else if(enct) cntout <= cntout-1;
end
endmodule
