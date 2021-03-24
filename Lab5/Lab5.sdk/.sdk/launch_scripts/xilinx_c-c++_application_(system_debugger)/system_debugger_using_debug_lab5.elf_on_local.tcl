connect -url tcp:127.0.0.1:3121
source /home/sebastian/Desktop/Git/EmbeddedSystems/Lab5/Lab5.sdk/top_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279785819A"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279785819A" && level==0} -index 1
fpga -file /home/sebastian/Desktop/Git/EmbeddedSystems/Lab5/Lab5.sdk/top_hw_platform_0/top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279785819A"} -index 0
loadhw -hw /home/sebastian/Desktop/Git/EmbeddedSystems/Lab5/Lab5.sdk/top_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279785819A"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279785819A"} -index 0
dow /home/sebastian/Desktop/Git/EmbeddedSystems/Lab5/Lab5.sdk/Lab5/Debug/Lab5.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279785819A"} -index 0
con
