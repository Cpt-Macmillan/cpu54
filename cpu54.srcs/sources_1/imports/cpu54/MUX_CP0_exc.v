`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 15:14:25
// Design Name: 
// Module Name: MUX_CP0_exc
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


module MUX_CP0_exc(
    input [31:0] Rd_rs,
    input [31:0] Rd_rt,
    input MUX_CP0_exc_ctr,
    input exc_CU,
    output reg exception
    );
    always@(*)begin
        if(MUX_CP0_exc_ctr == 0) begin
            exception <= exc_CU;
        end
        else begin
            exception <= (Rd_rs == Rd_rt);
        end
    end
endmodule
