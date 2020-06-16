`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 11:03:39 PM
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


module counter(output reg [7:0] cnout, input [7:0] cnin, input ldct,enct,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset)
        cnout <= 0;
    else if (ldct)
        cnout <= cnin;
    else if (enct)
        cnout <= cnout + 1;
end
endmodule
