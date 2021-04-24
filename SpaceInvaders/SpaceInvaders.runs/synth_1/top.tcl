# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.cache/wt [current_project]
set_property parent.project_path /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:2.0 [current_project]
set_property ip_output_repo /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/hdl/SpaceInvaders_wrapper.vhd
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/imports/new/color_channel.vhd
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/imports/new/pwm_generator.vhd
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/imports/new/row.vhd
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/imports/new/timer.vhd
  /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/imports/new/top.vhd
}
add_files /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/SpaceInvaders.bd
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/SpaceInvaders_xadc_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xadc_wiz_0_0/SpaceInvaders_xadc_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_blk_mem_gen_0_0/SpaceInvaders_blk_mem_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_blk_mem_gen_0_1/SpaceInvaders_blk_mem_gen_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_0_0/SpaceInvaders_axi_bram_ctrl_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_0_1/SpaceInvaders_axi_bram_ctrl_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_0/SpaceInvaders_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_0/SpaceInvaders_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_0/SpaceInvaders_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_1/SpaceInvaders_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_1/SpaceInvaders_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_gpio_0_1/SpaceInvaders_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_processing_system7_0_0/SpaceInvaders_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_xbar_2/SpaceInvaders_xbar_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_axi_intc_2/SpaceInvaders_microblaze_0_axi_intc_2.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_axi_intc_2/SpaceInvaders_microblaze_0_axi_intc_2_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_axi_intc_2/SpaceInvaders_microblaze_0_axi_intc_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_mdm_1_2/SpaceInvaders_mdm_1_2.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_mdm_1_2/SpaceInvaders_mdm_1_2_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_rst_ps7_0_100M_0/SpaceInvaders_rst_ps7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_rst_ps7_0_100M_0/SpaceInvaders_rst_ps7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_rst_ps7_0_100M_0/SpaceInvaders_rst_ps7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_bram_ctrl_2_1/SpaceInvaders_axi_bram_ctrl_2_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_1/bd_2130_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_1/bd_2130_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_5/bd_2130_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_6/bd_2130_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_7/bd_2130_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_8/bd_2130_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_9/bd_2130_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_10/bd_2130_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_axi_smc_1/bd_0/ip/ip_11/bd_2130_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_0/SpaceInvaders_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_0/SpaceInvaders_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_microblaze_0_0/SpaceInvaders_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_dlmb_v10_0/SpaceInvaders_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_dlmb_v10_0/SpaceInvaders_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_ilmb_v10_0/SpaceInvaders_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_ilmb_v10_0/SpaceInvaders_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_dlmb_bram_if_cntlr_0/SpaceInvaders_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_ilmb_bram_if_cntlr_0/SpaceInvaders_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_lmb_bram_0/SpaceInvaders_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_auto_pc_0/SpaceInvaders_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/ip/SpaceInvaders_auto_pc_1/SpaceInvaders_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/sources_1/bd/SpaceInvaders/SpaceInvaders_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/constrs_1/imports/new/RGB_Matrix.xdc
set_property used_in_implementation false [get_files /home/sebastian/Desktop/Git/EmbeddedSystems/SpaceInvaders/SpaceInvaders.srcs/constrs_1/imports/new/RGB_Matrix.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
