`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module DMEM_temp(
    input clk,
    input [1:0]DMEM_Write_ctr,
    input [31:0] Address,
    input [31:0] Write,
    output [31:0] DMEM_WD,
    output [15:0] DMEM_HW,
    output [7:0] DMEM_byte
    );
    reg [7:0] RAM [1023:0];
    assign DMEM_WD[7:0] = RAM[Address];
    assign DMEM_WD[15:8] = RAM[Address + 1];
    assign DMEM_WD[23:16] = RAM[Address + 2];
    assign DMEM_WD[31:24] = RAM[Address + 3];
    assign DMEM_HW[7:0] = RAM[Address];
    assign DMEM_HW[15:8] = RAM[Address + 1];
    assign DMEM_byte[7:0] = RAM[Address];
    always @(negedge clk) begin
        if(DMEM_Write_ctr == 2'b1) begin
            RAM[Address] <= Write[7:0];
            RAM[Address+1] <= Write[15:8];
            RAM[Address+2] <= Write[23:16];
            RAM[Address+3] <= Write[31:24];
        end
        else if(DMEM_Write_ctr == 2'b10)begin
            RAM[Address] <= Write[7:0];
            RAM[Address+1] <= Write[15:8];

        end
        else if(DMEM_Write_ctr == 2'b11)begin
            RAM[Address] <= Write[7:0];
        end
    end 
endmodule
