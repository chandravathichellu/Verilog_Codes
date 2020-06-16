`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 01:16:46 PM
// Design Name: 
// Module Name: mantf
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


module mantf(output reg [22:0] out, input [2:0] ch,input [47:0] in);
always @(*)
begin
    if(ch[2])
    begin
        out = in[46:24];
        if(in[23:21]>3'b100)
            out = out + 1'b1;
    end
    else if(ch[1])
    begin
        out = in[45:23];
        if(in[22:20]>3'b100)
             out = out + 1'b1;
    end
    else if(ch[0])
    begin
        out = in[44:22];
        if(in[21:19]>3'b100)
             out = out + 1'b1;
    end
end
endmodule
