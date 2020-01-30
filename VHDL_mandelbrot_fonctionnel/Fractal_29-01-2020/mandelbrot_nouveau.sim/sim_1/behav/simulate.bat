@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim top_Mandelbrot_tb_behav -key {Behavioral:sim_1:Functional:top_Mandelbrot_tb} -tclbatch top_Mandelbrot_tb.tcl -view H:/FRACTALE/fractale/Fractale-It/vivado/Mandelbrot/top_Mandelbrot_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
