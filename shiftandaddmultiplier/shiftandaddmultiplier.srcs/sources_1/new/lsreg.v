`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 10:48:58 PM
// Design Name: 
// Module Name: lsreg
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


module lsreg(output reg [15:0] lrout, input [15:0] lrin, input [7:0] shnum, input ldlr, shct, clk,reset); 
always @(posedge clk,posedge reset)
begin
    if(reset)
        lrout <= 0;
    else if(ldlr)
        lrout <= lrin ;
    else if(shct)
        lrout <= lrin << shnum;
end
endmodule
