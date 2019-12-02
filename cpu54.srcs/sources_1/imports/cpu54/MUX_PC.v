`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module MUX_PC(
    input [2:0] MUX_PC_ctr,
    input [31:0] PC_plus4,
    input [31:0] RD_rs,
    input [31:0] ALU_result,
    input [31:0] PC_Joint_result,
    input [31:0] exc_addr,
    output reg [31:0] NPC
    );
    always @(*) begin
        case(MUX_PC_ctr)
            3'b000: NPC <= PC_plus4;
            3'b001: NPC <= RD_rs;
            3'b010: NPC <= ALU_result;
            3'b011: NPC <= PC_Joint_result;
            3'b100: NPC <= exc_addr;
        endcase
    end
endmodule
