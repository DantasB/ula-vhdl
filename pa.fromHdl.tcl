
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name bdantas -dir "/home/sd/bdantas/planAhead_run_2" -part xc3s700anfgg484-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "contapain.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/somapain.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/somapain4_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/Complementa_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/subtratain4_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/Modulo_Xor_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/Modulo_Or_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/Modulo_And_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/Inversor_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/incrementa1_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/ULA_com_flag.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Downloads/compartilhavm/compartilhavm/contapain.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top contapain $srcset
add_files [list {contapain.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s700anfgg484-4
