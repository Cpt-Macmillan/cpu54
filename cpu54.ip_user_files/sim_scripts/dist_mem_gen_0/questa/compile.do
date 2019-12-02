vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/dist_mem_gen_v8_0_10

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap dist_mem_gen_v8_0_10 msim/dist_mem_gen_v8_0_10

vlog -work xil_defaultlib -64 -sv \
"D:/shuZiLuoJi/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 \
"D:/shuZiLuoJi/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_10 -64 \
"../../../ipstatic/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 \
"../../../../cpu54.srcs/sources_1/ip/dist_mem_gen_0/sim/dist_mem_gen_0.v" \


vlog -work xil_defaultlib "glbl.v"

