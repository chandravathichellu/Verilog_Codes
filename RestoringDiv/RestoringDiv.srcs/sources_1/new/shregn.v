`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2020 03:23:04 PM
// Design Name: 
// Module Name: shregn
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


module shregn(output reg [7:0] out, input [7:0] in, input din,ld,shct,ldb,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset)
        out <= 0;
    else if(ld)
        out <= in;
    else if(shct)
        out <= {out[6:0],din};
    else if(ldb)
        out[0] <= din;
end
endmodule
