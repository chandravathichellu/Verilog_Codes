`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 06:45:40 PM
// Design Name: 
// Module Name: bubblecp
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


module bubblecp(output reg ld,ldout,ldct, enct,done, output reg [2:0] sel0,sel1,sel2,sel3,sel4, input [3:0] gt, input zero,clk,st );
reg [2:0] state, next_state;
parameter s0= 3'b000, s1= 3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110, s7=3'b111;
always @(posedge clk)
    state <= next_state;
always @(state,st,gt)
case (state)
    s0 : if(st) begin ld=1; ldout=0;ldct=0; enct=0; sel0=0;sel1=0;sel2=0;sel3=0;sel4=0;done=0; next_state = s1; end
    s1 : begin ld=0; ldout=1; ldct=1; enct=0; sel0=0;sel1=0;sel2=0;sel3=0;sel4=0;done=0; next_state = s2; end
    s2 : if(zero) begin ldout=0;next_state=s6; end
         else
          begin if(gt[3]) begin ld=0; ldout=1; ldct=0; enct=0;  sel0=3'b010;sel1=3'b001;sel2=3'b011;sel3=3'b100;sel4=3'b101;done=0;  end 
          else begin ld=0; ldout=1; ldct=0; enct=0;sel0=3'b001;sel1=3'b010;sel2=3'b011;sel3=3'b100;sel4=3'b101;done=0; end
          next_state = s3; end
    s3 : begin if(gt[2]) begin ld=0; ldout=1; ldct=0; enct=0; sel0=3'b001;sel1=3'b011;sel2=3'b010;sel3=3'b100;sel4=3'b101;done=0;  end
         else begin ld=0; ldout=1; ldct=0; enct=0;sel0=3'b001;sel1=3'b010;sel2=3'b011;sel3=3'b100;sel4=3'b101;done=0; end
         next_state = s4; end
    s4 : begin if(gt[1]) begin ld=0; ldout=1; ldct=0; enct=0;sel0=3'b001;sel1=3'b010;sel2=3'b100;sel3=3'b011;sel4=3'b101;done=0;  end
         else begin ld=0; ld=0; ldout=1; ldct=0; enct=0;sel0=3'b001;sel1=3'b010;sel2=3'b011;sel3=3'b100;sel4=3'b101;done=0; end
         next_state = s5; end 
    s5 : begin if(gt[0]) begin ld=0; ldout=1;ldct=0; enct=1; sel0=3'b001;sel1=3'b010;sel2=3'b011;sel3=3'b101;sel4=3'b100;done=0;  end
         else begin ld=0; ldout=1; ldct=0; enct=1;sel0=3'b001;sel1=3'b010;sel2=3'b011;sel3=3'b100;sel4=3'b101;done=0; end
         next_state = s2; end
    s6 : begin done =1; next_state = s6; end
    default : begin ld=0; ldout=0; ldct=0; enct=0; sel0=0;sel1=0;sel2=0;sel3=0;sel4=0;done=0; next_state=s0; end
endcase
endmodule
