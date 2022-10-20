onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /triadd_test/dataIn
add wave -noupdate /triadd_test/dataBus
add wave -noupdate /triadd_test/enbIn
add wave -noupdate /triadd_test/enbA
add wave -noupdate /triadd_test/enbB
add wave -noupdate /triadd_test/enbC
add wave -noupdate /triadd_test/enbAdd
add wave -noupdate /triadd_test/ldA
add wave -noupdate /triadd_test/ldB
add wave -noupdate /triadd_test/ldC
add wave -noupdate /triadd_test/reset
add wave -noupdate /triadd_test/clock
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {57 ps} {102 ps}
