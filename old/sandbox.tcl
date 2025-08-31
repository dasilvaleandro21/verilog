# Open the existing project
open_project ./led_project/led_project.xpr

# Reset implementation run
reset_run impl_1

# Run implementation
launch_runs impl_1 -jobs 4
wait_on_run impl_1

# Write the bitstream to file explicitly
open_run impl_1
write_bitstream -force ./led_project/led_blink.bit