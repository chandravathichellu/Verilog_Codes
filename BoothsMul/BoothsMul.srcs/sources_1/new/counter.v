`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 11:50:35 AM
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


module counter(output reg [4:0] cnout, input [4:0] cnin, input ldcn,enct,clk,reset);
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
