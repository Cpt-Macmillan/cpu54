`timescale 1ns / 1ps

module PC_plus4(
    input [31:0] Ins_add,
    output [31:0] PC_plus4
    );
    assign PC_plus4 = Ins_add + 4;
endmodule
