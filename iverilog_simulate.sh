iverilog -o tb_led_blink.vvp tb_led_blink.v
vvp tb_led_blink.vvp
vcd2fst.exe led_blink.vcd led_blink2.vcd  # reduce file size for gtkwave
gtkwave.exe --dark led_blink2.vcd