`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module PC_Joint(
    input [25:0] addr,
    input [3:0] PC_plus4,
    output [31:0] PC_Joint_result
    );
    assign PC_Joint_result = {PC_plus4[3:0],addr,2'b0};
endmodule
