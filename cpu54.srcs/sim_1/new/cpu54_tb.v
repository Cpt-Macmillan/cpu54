`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 00:17:25
// Design Name: 
// Module Name: new_CPU31_tb
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


module cpu54_tb1();
reg clk;
reg rst;

//integer file_output;
integer counter = 0;



sccomp_dataflow uut(
    //output [7:0]o_seg,
    //output [7:0]o_sel,
    .clk_in(clk),
    .reset(rst)  
    //input switch_mux,

);


initial begin
    //file_output = $fopen("D:/result.txt");
    //initialize inputs
    clk = 1;
    rst = 1;
    #100;
    rst = 0;
end

always begin
    #10;
    clk = ~clk;
    if( clk == 1'b1 )begin
            counter = counter + 1;
//            $fdisplay(file_output, "pc: %h", pc_no4);
//          $fdisplay(file_output, "instr: %h", inst);
//            $fdisplay(file_output, "regfile0: %h", uut.sccpu.cpu_ref.array_reg[0]);
//            $fdisplay(file_output, "regfile1: %h", uut.sccpu.cpu_ref.array_reg[1]);
//            $fdisplay(file_output, "regfile2: %h", uut.sccpu.cpu_ref.array_reg[2]);
//            $fdisplay(file_output, "regfile3: %h", uut.sccpu.cpu_ref.array_reg[3]);
//            $fdisplay(file_output, "regfile4: %h", uut.sccpu.cpu_ref.array_reg[4]);
//            $fdisplay(file_output, "regfile5: %h", uut.sccpu.cpu_ref.array_reg[5]);
//            $fdisplay(file_output, "regfile6: %h", uut.sccpu.cpu_ref.array_reg[6]);
//            $fdisplay(file_output, "regfile7: %h", uut.sccpu.cpu_ref.array_reg[7]);
//            $fdisplay(file_output, "regfile8: %h", uut.sccpu.cpu_ref.array_reg[8]);
//            $fdisplay(file_output, "regfile9: %h", uut.sccpu.cpu_ref.array_reg[9]);
//            $fdisplay(file_output, "regfile10: %h", uut.sccpu.cpu_ref.array_reg[10]);
//            $fdisplay(file_output, "regfile11: %h", uut.sccpu.cpu_ref.array_reg[11]);
//            $fdisplay(file_output, "regfile12: %h", uut.sccpu.cpu_ref.array_reg[12]);
//            $fdisplay(file_output, "regfile13: %h", uut.sccpu.cpu_ref.array_reg[13]);
//            $fdisplay(file_output, "regfile14: %h", uut.sccpu.cpu_ref.array_reg[14]);
//            $fdisplay(file_output, "regfile15: %h", uut.sccpu.cpu_ref.array_reg[15]);
//            $fdisplay(file_output, "regfile16: %h", uut.sccpu.cpu_ref.array_reg[16]);
//            $fdisplay(file_output, "regfile17: %h", uut.sccpu.cpu_ref.array_reg[17]);
//            $fdisplay(file_output, "regfile18: %h", uut.sccpu.cpu_ref.array_reg[18]);
//            $fdisplay(file_output, "regfile19: %h", uut.sccpu.cpu_ref.array_reg[19]);
//            $fdisplay(file_output, "regfile20: %h", uut.sccpu.cpu_ref.array_reg[20]);
//            $fdisplay(file_output, "regfile21: %h", uut.sccpu.cpu_ref.array_reg[21]);
//            $fdisplay(file_output, "regfile22: %h", uut.sccpu.cpu_ref.array_reg[22]);
//            $fdisplay(file_output, "regfile23: %h", uut.sccpu.cpu_ref.array_reg[23]);
//            $fdisplay(file_output, "regfile24: %h", uut.sccpu.cpu_ref.array_reg[24]);
//            $fdisplay(file_output, "regfile25: %h", uut.sccpu.cpu_ref.array_reg[25]);
//            $fdisplay(file_output, "regfile26: %h", uut.sccpu.cpu_ref.array_reg[26]);
//            $fdisplay(file_output, "regfile27: %h", uut.sccpu.cpu_ref.array_reg[27]);
//            $fdisplay(file_output, "regfile28: %h", uut.sccpu.cpu_ref.array_reg[28]);
//            $fdisplay(file_output, "regfile29: %h", uut.sccpu.cpu_ref.array_reg[29]);
//            $fdisplay(file_output, "regfile30: %h", uut.sccpu.cpu_ref.array_reg[30]);
//            $fdisplay(file_output, "regfile31: %h", uut.sccpu.cpu_ref.array_reg[31]);

	end
end


endmodule
