`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2020 02:43:46 PM
// Design Name: 
// Module Name: FPMCP
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


module FPMCP (output reg ldA,ldB,ldD,ldS,ldE,ldM,ldFS,ldFE,ldFM,done,carryin, output reg [2:0] sel,  input [2:0] ch, input zeroA,zeroB,check,st,clk) ;
reg [2:0] state,next_state;
parameter s0 = 3'b000, s1= 3'b001, s2 = 3'b010, s3 =3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7 = 3'b111;
always @(posedge clk)
    state<=next_state;
always @(state,st,zeroA,zeroB,check,ch)
begin
    case (state)
    s0 : if(st) begin ldA=1;ldB=1;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b0;carryin=0;done=0;next_state= s1; end else next_state=s0;
    s1 : if(zeroA | zeroB) begin ldA=0;ldB=0;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b100;carryin=0;done=0; next_state=s7; end
         else begin ldA=0;ldB=0;ldD=0;ldS=1;ldE=1;ldM=1;ldFS=0;ldFE=0;ldFM=0;sel=3'b0;carryin=0;done=0; next_state=s2; end
    s2 : begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b0;carryin=0;done=0; next_state=s3; end
    s3 : begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b001;carryin=1'b0;done=0; next_state=s4; end
    s4 : begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b010;carryin=1'b1;done=0; next_state=s5; end
    s5 : begin if(ch[2]) begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b011;carryin=1'b0;done=0; end
         else if(ch[1]) begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b100;carryin=1'b0;done=0; end
         else if(ch[0]) begin ldA=0;ldB=0;ldD=1;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b011;carryin=1'b1;done=0; end
         next_state=s6; end
    s6:  if(check) begin ldA=0;ldB=0;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b100;carryin=1'b0;done=0;next_state= s7; end
         else begin ldA=0;ldB=0;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=1;ldFE=1;ldFM=1;sel=3'b100;carryin=1'b0;done=0; next_state=s7; end
    s7 : begin ldA=0;ldB=0;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;done=1;next_state= s7; end 
    default : begin ldA=0;ldB=0;ldD=0;ldS=0;ldE=0;ldM=0;ldFS=0;ldFE=0;ldFM=0;sel=3'b0;carryin=0;done=0;next_state= s0; end
    endcase
end
endmodule
