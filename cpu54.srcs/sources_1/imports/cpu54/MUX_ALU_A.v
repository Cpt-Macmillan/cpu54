`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 19:38:11
// Design Name: 
// Module Name: MUX_ALU_A
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


 module MUX_ALU_A(
    input MUX_ALU_A_ctr,
    input [31:0] Rd_rs,
    input [31:0] shamt,
    output reg [31:0] ALU_A
    );
    always @(*)begin
        if(MUX_ALU_A_ctr == 1) begin
            ALU_A <= shamt;
        end
        else begin
            ALU_A <= Rd_rs;
        end
    end
endmodule
