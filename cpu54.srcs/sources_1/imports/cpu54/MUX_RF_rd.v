`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


 module MUX_RF_rd(
    input [1:0] MUX_RF_rd_ctr,
    input [4:0] rd,
    input [4:0] rt,
    output reg [4:0] RF_rd
    );
    always @(*)begin
    case (MUX_RF_rd_ctr) 
        2'b00: RF_rd <= rd;
        2'b01: RF_rd <= rt;
        2'b10: RF_rd <= 5'b11111;
    endcase
    end
endmodule
