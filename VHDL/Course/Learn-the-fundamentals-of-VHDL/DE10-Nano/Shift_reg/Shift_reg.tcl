transcript off
vcom shift_reg.vhd
vcom test_shift_reg.vhd

vsim -voptargs="+acc" test_shift_reg
add wave sim:/test_shift_reg/dev_to_test/*

run 350 ns
