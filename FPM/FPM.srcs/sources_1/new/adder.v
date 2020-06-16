`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 12:38:08 PM
// Design Name: 
// Module Name: adder
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


module adder(output [7:0] addo, output carryo, input [7:0] ina,inb, input carryin);
genvar i;
wire [8:0] c;
wire [7:0] inbn;
assign c[0] = carryin;
generate for(i=0;i<8;i=i+1)
begin
    xor xr (inbn[i],inb[i],carryin);
    fulladder fa (addo[i],c[i+1],ina[i],inbn[i],c[i]);
end
endgenerate
assign carryo= c[8];
endmodule
