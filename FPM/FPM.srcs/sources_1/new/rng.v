`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 10:48:39 PM
// Design Name: 
// Module Name: rng
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


module rng(output reg [31:0] out, input signa,signb, input [7:0] exa,exb, input [47:0] prod);
integer i,k=0;
reg [8:0] exo;
always @(*)
begin
    if(exa==8'h00 & exb==8'h00 & prod==48'h400000000000)
            out = 32'h0;
    else
    if(prod[47])
    begin
        exo = exa+exb-8'b01111111+1;
        if(exo[8])
            out = 32'hx;
        else
            out ={signa^signb,exo[7:0],prod[46:24]};
    end
    else if(prod[46] & ~prod[47])
    begin 
        exo = exa+exb-8'b01111111;
        if(exo[8])
             out = 32'hx;
        else
        out ={signa^signb, exo[7:0], prod[45:23]};
    end
    else if(prod[45] & ~prod[46] & ~prod[47])
    begin
        exo = exa+exb-8'b01111111-1'b1;
        if(exo[8])
              out = 32'hx;
        else
        out = {signa^signb,exo[7:0], prod[44:22]};
    end
end
endmodule
