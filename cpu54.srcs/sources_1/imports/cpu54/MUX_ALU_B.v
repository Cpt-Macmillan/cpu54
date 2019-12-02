`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 19:50:40
// Design Name: 
// Module Name: MUX_ALU_B
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


module MUX_ALU_B(
    input MUX_ALU_B_ctr,
    input [31:0] Rd_rt,
    input [31:0] imm_extend,
    output reg [31:0] ALU_B
    );
    always @(*)begin
        if(MUX_ALU_B_ctr == 1) begin
            ALU_B <= imm_extend;
        end
        else begin
            ALU_B <= Rd_rt;
        end
    end
endmodule
