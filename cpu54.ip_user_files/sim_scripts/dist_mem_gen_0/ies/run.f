-makelib ies/xil_defaultlib -sv \
  "D:/shuZiLuoJi/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "D:/shuZiLuoJi/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/dist_mem_gen_v8_0_10 \
  "../../../ipstatic/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../cpu54.srcs/sources_1/ip/dist_mem_gen_0/sim/dist_mem_gen_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

