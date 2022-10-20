transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/CNT.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/COMP.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/ZeroDetect.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/PWMOuput.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/DataPath.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/ControlUnit.v}
vlog -vlog01compat -work work +incdir+D:/uni/EE/EE\ 460/assgiments/Verilog\ A#4 {D:/uni/EE/EE 460/assgiments/Verilog A#4/PWM.v}

