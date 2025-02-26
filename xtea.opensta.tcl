# FROM OpenLane/scripts/sta.tcl
# Autogenerated by zz script

set_cmd_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm -distance um

read_liberty -min ../techlib/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_liberty -max ../techlib/sky130_fd_sc_hd__ss_100C_1v60.lib
read_verilog xtea.synthesis_preroute.v
link_design xtea
read_spef 20-xtea.spef
read_sdc xtea.cts_1.sdc
report_wns
report_tns
write_sdf -digits 20 xtea.at.sdf
exit

