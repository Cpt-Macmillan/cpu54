onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -lib xil_defaultlib xil_defaultlib.dist_mem_gen_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {dist_mem_gen_0.udo}

run -all

quit -force
