`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 11:37:01 PM
// Design Name: 
// Module Name: gcdcp
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


module gcdcp(output reg ld,done, output reg [1:0] sela,selb, input gt,eq,lt,st,clk);
reg [1:0] state, next_state;
parameter s0=2'b00, s1=2'b01,s2=2'b10, s3=2'b11;
always @(posedge clk)
    state <= next_state;
always @(state, st,gt,eq,lt)
begin
    case (state)
        s0 : if(st) begin ld=1; sela=2'b00; selb=2'b00; done=0; next_state=s1; end
        s1 : if(gt) begin ld=1; sela=2'b10; selb=2'b01; done=0; next_state=s1; end 
             else if(lt) begin ld=1; sela=2'b01; selb=2'b10; done=0; next_state=s1; end
             else begin ld=0; sela=2'b11; selb=2'b11; done=1; next_state=s2; end
        s2 : next_state = s2;
        default : begin ld=0; sela=2'b00; selb=2'b00; done=0; next_state=s0; end
       endcase
end
endmodule
