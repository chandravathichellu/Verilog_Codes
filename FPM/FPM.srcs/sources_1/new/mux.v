`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 12:25:42 PM
// Design Name: 
// Module Name: mux
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


module mux(output reg [7:0] out , input [2:0] sel, input [7:0] in1,in2,in3,in4,in5);
always @(*)
begin
 case(sel)
    0: out <= in1;
    1: out <= in2;
    2: out <= in3;
    3: out <= in4;
    4: out <= in5;
    default : out <= 8'b0;
 endcase
end
endmodule

