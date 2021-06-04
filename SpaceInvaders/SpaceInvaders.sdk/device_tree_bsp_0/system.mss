
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = device_tree
 PARAMETER PROC_INSTANCE = ps7_cortexa9_0
 PARAMETER console_device = ps7_uart_1
 PARAMETER main_memory = ps7_ddr_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu_cortexa9
 PARAMETER HW_INSTANCE = ps7_cortexa9_0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = axi_bram_ctrl_2
 PARAMETER compatible = xlnx,axi-bram-ctrl-4.1
 PARAMETER reg = 0x42000000 0x2000
 PARAMETER xlnx,bram-addr-width = 11
 PARAMETER xlnx,bram-inst-mode = EXTERNAL
 PARAMETER xlnx,ecc = 0
 PARAMETER xlnx,ecc-onoff-reset-value = 0
 PARAMETER xlnx,ecc-type = 0
 PARAMETER xlnx,fault-inject = 0
 PARAMETER xlnx,memory-depth = 2048
 PARAMETER xlnx,rd-cmd-optimization = 0
 PARAMETER xlnx,read-latency = 1
 PARAMETER xlnx,s-axi-ctrl-addr-width = 32
 PARAMETER xlnx,s-axi-ctrl-data-width = 32
 PARAMETER xlnx,s-axi-id-width = 1
 PARAMETER xlnx,s-axi-supports-narrow-burst = 0
 PARAMETER xlnx,select-xpm = 1
 PARAMETER xlnx,single-port-bram = 1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER HW_INSTANCE = axi_gpio_0
 PARAMETER reg = 0x40000000 0x10000
 PARAMETER xlnx,all-inputs = 0
 PARAMETER xlnx,all-inputs-2 = 0
 PARAMETER xlnx,all-outputs = 1
 PARAMETER xlnx,all-outputs-2 = 0
 PARAMETER xlnx,dout-default = 0x00000000
 PARAMETER xlnx,dout-default-2 = 0x00000000
 PARAMETER xlnx,gpio-width = 4
 PARAMETER xlnx,gpio2-width = 32
 PARAMETER xlnx,interrupt-present = 0
 PARAMETER xlnx,is-dual = 0
 PARAMETER xlnx,tri-default = 0xFFFFFFFF
 PARAMETER xlnx,tri-default-2 = 0xFFFFFFFF
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER HW_INSTANCE = axi_gpio_1
 PARAMETER reg = 0x40010000 0x10000
 PARAMETER xlnx,all-inputs = 1
 PARAMETER xlnx,all-inputs-2 = 0
 PARAMETER xlnx,all-outputs = 0
 PARAMETER xlnx,all-outputs-2 = 0
 PARAMETER xlnx,dout-default = 0x00000000
 PARAMETER xlnx,dout-default-2 = 0x00000000
 PARAMETER xlnx,gpio-width = 1
 PARAMETER xlnx,gpio2-width = 32
 PARAMETER xlnx,interrupt-present = 0
 PARAMETER xlnx,is-dual = 0
 PARAMETER xlnx,tri-default = 0xFFFFFFFF
 PARAMETER xlnx,tri-default-2 = 0xFFFFFFFF
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = intc
 PARAMETER HW_INSTANCE = microblaze_0_axi_intc
 PARAMETER reg = 0x41200000 0x10000
 PARAMETER xlnx,kind-of-intr = 3
 PARAMETER xlnx,num-intr-inputs = 2
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_2
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_3
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_coresight_comp_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ddrps
 PARAMETER HW_INSTANCE = ps7_ddr_0
 PARAMETER reg = 0x0 0x20000000
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ddrcps
 PARAMETER HW_INSTANCE = ps7_ddrc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = devcfg
 PARAMETER HW_INSTANCE = ps7_dev_cfg_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = none
 PARAMETER HW_INSTANCE = ps7_dma_ns
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = dmaps
 PARAMETER HW_INSTANCE = ps7_dma_s
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = emacps
 PARAMETER HW_INSTANCE = ps7_ethernet_0
 PARAMETER phy-mode = rgmii-id
 PARAMETER xlnx,ptp-enet-clock = 108333336
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = globaltimerps
 PARAMETER HW_INSTANCE = ps7_globaltimer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpiops
 PARAMETER HW_INSTANCE = ps7_gpio_0
 PARAMETER emio-gpio-width = 64
 PARAMETER gpio-mask-high = 0
 PARAMETER gpio-mask-low = 22016
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_gpv_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_intc_dist_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_iop_bus_config_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_l2cachec_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ocmcps
 PARAMETER HW_INSTANCE = ps7_ocmc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = pl310ps
 PARAMETER HW_INSTANCE = ps7_pl310_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = pmups
 PARAMETER HW_INSTANCE = ps7_pmu_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = qspips
 PARAMETER HW_INSTANCE = ps7_qspi_0
 PARAMETER is-dual = 0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_qspi_linear_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ramps
 PARAMETER HW_INSTANCE = ps7_ram_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = none
 PARAMETER HW_INSTANCE = ps7_ram_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_scuc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scugic
 PARAMETER HW_INSTANCE = ps7_scugic_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scutimer
 PARAMETER HW_INSTANCE = ps7_scutimer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scuwdt
 PARAMETER HW_INSTANCE = ps7_scuwdt_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = slcrps
 PARAMETER HW_INSTANCE = ps7_slcr_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ttcps
 PARAMETER HW_INSTANCE = ps7_ttc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartps
 PARAMETER HW_INSTANCE = ps7_uart_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = xadcps
 PARAMETER HW_INSTANCE = ps7_xadc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = axi_xadc
 PARAMETER HW_INSTANCE = xadc_wiz_0
 PARAMETER clock-names = ref_clk
 PARAMETER clocks = clkc 0
 PARAMETER compatible = xlnx,axi-xadc-1.00.a
 PARAMETER reg = 0x44a00000 0x10000
 PARAMETER xlnx,alarm-limit-r0 = 46573
 PARAMETER xlnx,alarm-limit-r1 = 22500
 PARAMETER xlnx,alarm-limit-r10 = 21845
 PARAMETER xlnx,alarm-limit-r11 = 20753
 PARAMETER xlnx,alarm-limit-r12 = 39321
 PARAMETER xlnx,alarm-limit-r13 = 37355
 PARAMETER xlnx,alarm-limit-r14 = 27306
 PARAMETER xlnx,alarm-limit-r15 = 26214
 PARAMETER xlnx,alarm-limit-r2 = 41287
 PARAMETER xlnx,alarm-limit-r3 = 51763
 PARAMETER xlnx,alarm-limit-r4 = 43322
 PARAMETER xlnx,alarm-limit-r5 = 21190
 PARAMETER xlnx,alarm-limit-r6 = 38229
 PARAMETER xlnx,alarm-limit-r7 = 44622
 PARAMETER xlnx,alarm-limit-r8 = 22937
 PARAMETER xlnx,alarm-limit-r9 = 20753
 PARAMETER xlnx,configuration-r0 = 4096
 PARAMETER xlnx,configuration-r1 = 8623
 PARAMETER xlnx,configuration-r2 = 1024
 PARAMETER xlnx,dclk-frequency = 100
 PARAMETER xlnx,external-mux = none
 PARAMETER xlnx,external-mux-channel = VP_VN
 PARAMETER xlnx,external-muxaddr-enable = 0
 PARAMETER xlnx,fifo-depth = 7
 PARAMETER xlnx,has-axi = 1
 PARAMETER xlnx,has-axi4stream = 0
 PARAMETER xlnx,has-busy = 1
 PARAMETER xlnx,has-channel = 1
 PARAMETER xlnx,has-convst = 0
 PARAMETER xlnx,has-convstclk = 0
 PARAMETER xlnx,has-dclk = 1
 PARAMETER xlnx,has-drp = 0
 PARAMETER xlnx,has-eoc = 1
 PARAMETER xlnx,has-eos = 1
 PARAMETER xlnx,has-external-mux = 0
 PARAMETER xlnx,has-jtagbusy = 0
 PARAMETER xlnx,has-jtaglocked = 0
 PARAMETER xlnx,has-jtagmodified = 0
 PARAMETER xlnx,has-ot-alarm = 0
 PARAMETER xlnx,has-reset = 0
 PARAMETER xlnx,has-temp-bus = 0
 PARAMETER xlnx,has-user-temp-alarm = 0
 PARAMETER xlnx,has-vbram-alarm = 0
 PARAMETER xlnx,has-vccaux-alarm = 0
 PARAMETER xlnx,has-vccddro-alarm = 0
 PARAMETER xlnx,has-vccint-alarm = 0
 PARAMETER xlnx,has-vccpaux-alarm = 0
 PARAMETER xlnx,has-vccpint-alarm = 0
 PARAMETER xlnx,has-vn = 1
 PARAMETER xlnx,has-vp = 1
 PARAMETER xlnx,include-intr = 1
 PARAMETER xlnx,sampling-rate = 961538.4615384615
 PARAMETER xlnx,sequence-r0 = 0
 PARAMETER xlnx,sequence-r1 = 49280
 PARAMETER xlnx,sequence-r2 = 0
 PARAMETER xlnx,sequence-r3 = 49280
 PARAMETER xlnx,sequence-r4 = 0
 PARAMETER xlnx,sequence-r5 = 0
 PARAMETER xlnx,sequence-r6 = 0
 PARAMETER xlnx,sequence-r7 = 0
 PARAMETER xlnx,sim-file-name = design
 PARAMETER xlnx,sim-file-rel-path = ./
 PARAMETER xlnx,sim-file-sel = Default
 PARAMETER xlnx,vaux0 = 0
 PARAMETER xlnx,vaux1 = 0
 PARAMETER xlnx,vaux10 = 0
 PARAMETER xlnx,vaux11 = 0
 PARAMETER xlnx,vaux12 = 0
 PARAMETER xlnx,vaux13 = 0
 PARAMETER xlnx,vaux14 = 1
 PARAMETER xlnx,vaux15 = 1
 PARAMETER xlnx,vaux2 = 0
 PARAMETER xlnx,vaux3 = 0
 PARAMETER xlnx,vaux4 = 0
 PARAMETER xlnx,vaux5 = 0
 PARAMETER xlnx,vaux6 = 0
 PARAMETER xlnx,vaux7 = 1
 PARAMETER xlnx,vaux8 = 0
 PARAMETER xlnx,vaux9 = 0
END


