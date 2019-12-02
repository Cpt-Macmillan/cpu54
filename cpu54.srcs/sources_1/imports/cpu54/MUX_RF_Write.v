`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module MUX_RF_Write(
    input [2:0] MUX_RF_Write_ctr,
    
    input [31:0] ALU_result,
    input [31:0] DMEM_WD,
    input [31:0] PC_plus4,
    input [31:0] DMEM_byte_32,
    input [31:0] DMEM_HW_32,
    input [31:0] hi,
    input [31:0] lo,
    input [31:0] CP0_rdata,
    
    output reg [31:0] RF_Write
    );
    always @(*)begin
        case(MUX_RF_Write_ctr)
            3'b000: RF_Write <= ALU_result;
            3'b001: RF_Write <= DMEM_WD;
            3'b010: RF_Write <= PC_plus4;
            3'b011: RF_Write <= DMEM_byte_32;
            3'b100: RF_Write <= DMEM_HW_32;
            3'b101: RF_Write <= hi;
            3'b110: RF_Write <= lo;
            3'b111: RF_Write <= CP0_rdata;
        endcase
    end
endmodule
