vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_2

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib -64 -sv \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 \
"../../../../Lab4.srcs/sources_1/bd/Lab3/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/Lab3/ip/Lab3_blk_mem_gen_0_0/sim/Lab3_blk_mem_gen_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Lab3/sim/Lab3.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

