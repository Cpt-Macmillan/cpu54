@echo off
set xv_path=D:\\shuZiLuoJi\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim cpu54_tb1_behav -key {Behavioral:sim_1:Functional:cpu54_tb1} -tclbatch cpu54_tb1.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
