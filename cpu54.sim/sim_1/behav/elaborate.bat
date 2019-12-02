@echo off
set xv_path=D:\\shuZiLuoJi\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 919a62ae869541cbbec1f08d88bdbb7a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -L unisims_ver -L unimacro_ver -L secureip --snapshot cpu54_tb1_behav xil_defaultlib.cpu54_tb1 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
