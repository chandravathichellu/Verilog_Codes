`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:30:47 PM
// Design Name: 
// Module Name: comparator
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


module comparator (output reg gt,eq,lt, input [7:0] a,b);
always @(*)
begin
    if(a>b)
        begin gt=1;lt=0;eq=0; end
    else if(a<b)
        begin gt=0;lt=1;eq=0; end
    else
        begin gt=0;lt=0;eq=1; end
end
endmodule
