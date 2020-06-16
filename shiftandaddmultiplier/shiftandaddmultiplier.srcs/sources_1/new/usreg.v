`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 11:50:02 PM
// Design Name: 
// Module Name: usreg
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


module usreg(output reg [7:0] out, input [7:0] in, input ld,rshct,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset)
        out <= 0;
    else if(ld)
        out <= in;
    else if(rshct)
        out <= out >> 1;
end
endmodule
