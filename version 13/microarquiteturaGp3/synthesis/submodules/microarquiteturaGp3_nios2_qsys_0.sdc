# Legal Notice: (C)2019 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	microarquiteturaGp3_nios2_qsys_0 	microarquiteturaGp3_nios2_qsys_0:*
set 	microarquiteturaGp3_nios2_qsys_0_oci 	microarquiteturaGp3_nios2_qsys_0_nios2_oci:the_microarquiteturaGp3_nios2_qsys_0_nios2_oci
set 	microarquiteturaGp3_nios2_qsys_0_oci_break 	microarquiteturaGp3_nios2_qsys_0_nios2_oci_break:the_microarquiteturaGp3_nios2_qsys_0_nios2_oci_break
set 	microarquiteturaGp3_nios2_qsys_0_ocimem 	microarquiteturaGp3_nios2_qsys_0_nios2_ocimem:the_microarquiteturaGp3_nios2_qsys_0_nios2_ocimem
set 	microarquiteturaGp3_nios2_qsys_0_oci_debug 	microarquiteturaGp3_nios2_qsys_0_nios2_oci_debug:the_microarquiteturaGp3_nios2_qsys_0_nios2_oci_debug
set 	microarquiteturaGp3_nios2_qsys_0_wrapper 	microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_wrapper:the_microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_wrapper
set 	microarquiteturaGp3_nios2_qsys_0_jtag_tck 	microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_tck:the_microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_tck
set 	microarquiteturaGp3_nios2_qsys_0_jtag_sysclk 	microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_sysclk:the_microarquiteturaGp3_nios2_qsys_0_jtag_debug_module_sysclk
set 	microarquiteturaGp3_nios2_qsys_0_oci_path 	 [format "%s|%s" $microarquiteturaGp3_nios2_qsys_0 $microarquiteturaGp3_nios2_qsys_0_oci]
set 	microarquiteturaGp3_nios2_qsys_0_oci_break_path 	 [format "%s|%s" $microarquiteturaGp3_nios2_qsys_0_oci_path $microarquiteturaGp3_nios2_qsys_0_oci_break]
set 	microarquiteturaGp3_nios2_qsys_0_ocimem_path 	 [format "%s|%s" $microarquiteturaGp3_nios2_qsys_0_oci_path $microarquiteturaGp3_nios2_qsys_0_ocimem]
set 	microarquiteturaGp3_nios2_qsys_0_oci_debug_path 	 [format "%s|%s" $microarquiteturaGp3_nios2_qsys_0_oci_path $microarquiteturaGp3_nios2_qsys_0_oci_debug]
set 	microarquiteturaGp3_nios2_qsys_0_jtag_tck_path 	 [format "%s|%s|%s" $microarquiteturaGp3_nios2_qsys_0_oci_path $microarquiteturaGp3_nios2_qsys_0_wrapper $microarquiteturaGp3_nios2_qsys_0_jtag_tck]
set 	microarquiteturaGp3_nios2_qsys_0_jtag_sysclk_path 	 [format "%s|%s|%s" $microarquiteturaGp3_nios2_qsys_0_oci_path $microarquiteturaGp3_nios2_qsys_0_wrapper $microarquiteturaGp3_nios2_qsys_0_jtag_sysclk]
set 	microarquiteturaGp3_nios2_qsys_0_jtag_sr 	 [format "%s|*sr" $microarquiteturaGp3_nios2_qsys_0_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$microarquiteturaGp3_nios2_qsys_0_oci_break_path|break_readreg*] -to [get_keepers *$microarquiteturaGp3_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$microarquiteturaGp3_nios2_qsys_0_oci_debug_path|*resetlatch]     -to [get_keepers *$microarquiteturaGp3_nios2_qsys_0_jtag_sr[33]]
set_false_path -from [get_keepers *$microarquiteturaGp3_nios2_qsys_0_oci_debug_path|monitor_ready]  -to [get_keepers *$microarquiteturaGp3_nios2_qsys_0_jtag_sr[0]]
set_false_path -from [get_keepers *$microarquiteturaGp3_nios2_qsys_0_oci_debug_path|monitor_error]  -to [get_keepers *$microarquiteturaGp3_nios2_qsys_0_jtag_sr[34]]
set_false_path -from [get_keepers *$microarquiteturaGp3_nios2_qsys_0_ocimem_path|*MonDReg*] -to [get_keepers *$microarquiteturaGp3_nios2_qsys_0_jtag_sr*]
set_false_path -from *$microarquiteturaGp3_nios2_qsys_0_jtag_sr*    -to *$microarquiteturaGp3_nios2_qsys_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$microarquiteturaGp3_nios2_qsys_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$microarquiteturaGp3_nios2_qsys_0_oci_debug_path|monitor_go
