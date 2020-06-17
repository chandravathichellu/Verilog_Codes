`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:33:56 PM
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


module mux(output reg [7:0] out, input [1:0] sel, input [7:0] in0,in1,in2);
always @(*)
 case(sel)  
      2'b00 : out <= in0;
      2'b01 : out <= in1;   
      2'b10 : out <= in2;
      default : out <= 0;
endcase
endmodule
