vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_2
vlib activehdl/blk_mem_gen_v8_3_6
vlib activehdl/axi_bram_ctrl_v4_1_0
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_20
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_4
vlib activehdl/processing_system7_vip_v1_0_6
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_18
vlib activehdl/fifo_generator_v13_2_3
vlib activehdl/axi_data_fifo_v2_1_17
vlib activehdl/axi_crossbar_v2_1_19
vlib activehdl/axi_intc_v4_1_12
vlib activehdl/xlconcat_v2_1_1
vlib activehdl/mdm_v3_2_15
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/xlconstant_v1_1_5
vlib activehdl/smartconnect_v1_0
vlib activehdl/microblaze_v11_0_0
vlib activehdl/lmb_v10_v3_0_9
vlib activehdl/lmb_bram_if_cntlr_v4_0_15
vlib activehdl/axi_protocol_converter_v2_1_18

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_2 activehdl/blk_mem_gen_v8_4_2
vmap blk_mem_gen_v8_3_6 activehdl/blk_mem_gen_v8_3_6
vmap axi_bram_ctrl_v4_1_0 activehdl/axi_bram_ctrl_v4_1_0
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_20 activehdl/axi_gpio_v2_0_20
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 activehdl/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 activehdl/processing_system7_vip_v1_0_6
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 activehdl/axi_register_slice_v2_1_18
vmap fifo_generator_v13_2_3 activehdl/fifo_generator_v13_2_3
vmap axi_data_fifo_v2_1_17 activehdl/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 activehdl/axi_crossbar_v2_1_19
vmap axi_intc_v4_1_12 activehdl/axi_intc_v4_1_12
vmap xlconcat_v2_1_1 activehdl/xlconcat_v2_1_1
vmap mdm_v3_2_15 activehdl/mdm_v3_2_15
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_5 activehdl/xlconstant_v1_1_5
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap microblaze_v11_0_0 activehdl/microblaze_v11_0_0
vmap lmb_v10_v3_0_9 activehdl/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_15 activehdl/lmb_bram_if_cntlr_v4_0_15
vmap axi_protocol_converter_v2_1_18 activehdl/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_family_support.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_family.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_soft_reset.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_pselect_f.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_address_decoder.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/SpaceInvaders_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/SpaceInvaders_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/SpaceInvaders_xadc_wiz_0_0_axi_xadc.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/SpaceInvaders_xadc_wiz_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_blk_mem_gen_0_0/sim/SpaceInvaders_blk_mem_gen_0_0.v" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_blk_mem_gen_0_1/sim/SpaceInvaders_blk_mem_gen_0_1.v" \

vlog -work blk_mem_gen_v8_3_6  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/2751/simulation/blk_mem_gen_v8_3.v" \

vcom -work axi_bram_ctrl_v4_1_0 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/27fe/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_0_0/sim/SpaceInvaders_axi_bram_ctrl_0_0.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_0_1/sim/SpaceInvaders_axi_bram_ctrl_0_1.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_20 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/a7c9/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_0/sim/SpaceInvaders_axi_gpio_0_0.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_1/sim/SpaceInvaders_axi_gpio_0_1.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0/sim/SpaceInvaders_processing_system7_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_17  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xbar_2/sim/SpaceInvaders_xbar_2.v" \

vcom -work axi_intc_v4_1_12 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/31e4/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_axi_intc_2/sim/SpaceInvaders_microblaze_0_axi_intc_2.vhd" \

vlog -work xlconcat_v2_1_1  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_xlconcat_2/sim/SpaceInvaders_microblaze_0_xlconcat_2.v" \

vcom -work mdm_v3_2_15 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/41ef/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_mdm_1_2/sim/SpaceInvaders_mdm_1_2.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_rst_ps7_0_100M_0/sim/SpaceInvaders_rst_ps7_0_100M_0.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_2_1/sim/SpaceInvaders_axi_bram_ctrl_2_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/sim/bd_2130.v" \

vlog -work xlconstant_v1_1_5  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_0/sim/bd_2130_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_1/sim/bd_2130_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_2/sim/bd_2130_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_3/sim/bd_2130_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_4/sim/bd_2130_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_5/sim/bd_2130_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_6/sim/bd_2130_sarn_0.sv" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_7/sim/bd_2130_srn_0.sv" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_8/sim/bd_2130_sawn_0.sv" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_9/sim/bd_2130_swn_0.sv" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_10/sim/bd_2130_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_11/sim/bd_2130_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_12/sim/bd_2130_m00e_0.sv" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/sim/SpaceInvaders_axi_smc_1.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/sim/SpaceInvaders.vhd" \

vcom -work microblaze_v11_0_0 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/2ed1/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_0/sim/SpaceInvaders_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_dlmb_v10_0/sim/SpaceInvaders_dlmb_v10_0.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_ilmb_v10_0/sim/SpaceInvaders_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_15 -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/92fd/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_dlmb_bram_if_cntlr_0/sim/SpaceInvaders_dlmb_bram_if_cntlr_0.vhd" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_ilmb_bram_if_cntlr_0/sim/SpaceInvaders_ilmb_bram_if_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_lmb_bram_0/sim/SpaceInvaders_lmb_bram_0.v" \

vlog -work axi_protocol_converter_v2_1_18  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/ec67/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/70cf/hdl" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/979d/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ipshared/b2d0/hdl/verilog" "+incdir+../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0" "+incdir+/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_auto_pc_0/sim/SpaceInvaders_auto_pc_0.v" \
"../../../../SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_auto_pc_1/sim/SpaceInvaders_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

