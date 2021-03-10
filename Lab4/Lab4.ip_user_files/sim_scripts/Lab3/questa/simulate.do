onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Lab3_opt

do {wave.do}

view wave
view structure
view signals

do {Lab3.udo}

run -all

quit -force
