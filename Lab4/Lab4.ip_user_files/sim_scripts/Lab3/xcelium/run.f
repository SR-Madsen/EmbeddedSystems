-makelib xcelium_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../Lab4.srcs/sources_1/bd/Lab3/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Lab3/ip/Lab3_blk_mem_gen_0_0/sim/Lab3_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Lab3/sim/Lab3.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

