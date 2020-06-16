`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 12:02:49 AM
// Design Name: 
// Module Name: FPMTB
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


module FPMTB();
wire [31:0] fpmo;
reg [31:0] a,b ;
reg clk,reset ;
FPMDP call(fpmo,a,b,clk,reset);
initial
begin
        a = 32'h00000000;
		b = 32'h00000000;
		#200
        a = 32'he36179a9;
		b = 32'h2d87eac1;
		#200
		a = 32'hd5927a43;
        b = 32'hec91a671;
	    #200
		a = 32'h8ca204ca;
        b = 32'h7ae3170a;
	    #200
		a = 32'h4a9023cd;
        b = 32'h238712ce;
		#200
		$finish;
end		
endmodule
