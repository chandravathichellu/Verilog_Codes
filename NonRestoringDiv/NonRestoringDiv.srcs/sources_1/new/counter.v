`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 11:13:42 PM
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


module counter(output reg [3:0] cnout, input [3:0] cnin, input ldcn,enct,clk,reset);
always @(posedge clk,posedge reset)
begin
    if(reset)
        cnout <= 0;
    else if(ldcn)
        cnout <= cnin;
    else if(enct)
        cnout <= cnout -1;
end
endmodule
