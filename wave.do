onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /stimulus_class/reset
add wave -noupdate /stimulus_class/Start
add wave -noupdate /stimulus_class/Found
add wave -noupdate /stimulus_class/clk
add wave -noupdate /stimulus_class/Key
add wave -noupdate /stimulus_class/dut/FoundKeyNum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {246938172 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 350
configure wave -valuecolwidth 200
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {52305750 ps}
