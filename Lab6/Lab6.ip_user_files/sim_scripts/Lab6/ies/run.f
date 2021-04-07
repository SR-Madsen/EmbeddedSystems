-makelib ies_lib/xilinx_vip -sv \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_4 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_processing_system7_0_0/sim/Lab6_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_blk_mem_gen_0_0/sim/Lab6_blk_mem_gen_0_0.v" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_3_6 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/2751/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies_lib/axi_bram_ctrl_v4_1_0 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/27fe/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_bram_ctrl_0_0/sim/Lab6_axi_bram_ctrl_0_0.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_conv_funs_pkg.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_proc_common_pkg.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_ipif_pkg.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_family_support.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_family.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_soft_reset.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_pselect_f.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_address_decoder.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_slave_attachment.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_interrupt_control.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/Lab6_xadc_wiz_0_0_axi_lite_ipif.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/Lab6_xadc_wiz_0_0_xadc_core_drp.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/Lab6_xadc_wiz_0_0_axi_xadc.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_xadc_wiz_0_0/Lab6_xadc_wiz_0_0.vhd" \
-endlib
-makelib ies_lib/xlconstant_v1_1_5 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_0/sim/bd_37e3_one_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_1/sim/bd_37e3_psr_aclk_0.vhd" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_2/sim/bd_37e3_arsw_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_3/sim/bd_37e3_rsw_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_4/sim/bd_37e3_awsw_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_5/sim/bd_37e3_wsw_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_6/sim/bd_37e3_bsw_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_7/sim/bd_37e3_s00mmu_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_8/sim/bd_37e3_s00tr_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_9/sim/bd_37e3_s00sic_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_10/sim/bd_37e3_s00a2s_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_11/sim/bd_37e3_sarn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_12/sim/bd_37e3_srn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_13/sim/bd_37e3_sawn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_14/sim/bd_37e3_swn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_15/sim/bd_37e3_sbn_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_16/sim/bd_37e3_m00s2a_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_17/sim/bd_37e3_m00arn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_18/sim/bd_37e3_m00rn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_19/sim/bd_37e3_m00awn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_20/sim/bd_37e3_m00wn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_21/sim/bd_37e3_m00bn_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_22/sim/bd_37e3_m00e_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_23/sim/bd_37e3_m01s2a_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_24/sim/bd_37e3_m01arn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_25/sim/bd_37e3_m01rn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_26/sim/bd_37e3_m01awn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_27/sim/bd_37e3_m01wn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_28/sim/bd_37e3_m01bn_0.sv" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/ip/ip_29/sim/bd_37e3_m01e_0.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/bd_0/sim/bd_37e3.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_axi_smc_0/sim/Lab6_axi_smc_0.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/ip/Lab6_rst_ps7_0_100M_0/sim/Lab6_rst_ps7_0_100M_0.vhd" \
  "../../../../Lab6.srcs/sources_1/bd/Lab6/sim/Lab6.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

