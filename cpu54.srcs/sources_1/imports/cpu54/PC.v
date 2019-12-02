`timescale 1ns / 1ps

module PC(
    input clk,
    input rst,
    input [31:0] NPC,
    output reg [31:0] Ins_add
    );
    reg [31:0] origin_Ins_add = 32'h00400000;
    always @(negedge clk) begin
        if(rst == 1) begin
            Ins_add <= origin_Ins_add;
        end
        else begin
            Ins_add <= NPC;
        end
    end

endmodule
