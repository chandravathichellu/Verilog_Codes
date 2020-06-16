`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 06:17:45 PM
// Design Name: 
// Module Name: shreg
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


module shreg(output reg [3:0] dout, input [3:0] din, input ld,ensh,clk,reset);
always @(posedge clk)
begin
    if (reset) dout <= 0;
    else if (ld) dout <= din;
    else if(ensh) dout <= {1'b0,dout[3:1]};
end
endmodule
