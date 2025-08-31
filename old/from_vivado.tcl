create_project led_project ./led_project -part xc7z020clg484-1 -force
add_files ./led_blink.v
add_files -fileset constrs_1 -norecurse ./pynq_z1.xdc
reset_run synth_1
launch_runs synth_1 -jobs 4
launch_runs impl_1 -jobs 4
#open_run impl_1
reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 4