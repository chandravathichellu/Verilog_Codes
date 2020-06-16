`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 06:26:48 PM
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


module shregn(output reg [3:0] dout, input din,ensh,clk,reset);
always @(posedge clk, posedge reset)
begin
    if(reset) dout <= 0;
    else if(ensh) dout <= {din, dout[3:1]};    
end
endmodule
