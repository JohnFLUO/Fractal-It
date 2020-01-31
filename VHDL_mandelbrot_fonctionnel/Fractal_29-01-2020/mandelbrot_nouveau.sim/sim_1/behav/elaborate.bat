@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto dd7aa73214ae4eda9ffc513e7a1aaaa3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot top_Mandelbrot_tb_behav xil_defaultlib.top_Mandelbrot_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
