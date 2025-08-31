# Create project
create_project led_project ./led_project -part xc7z020clg400-1 -force

# Add Verilog source
add_files ./led_blink.v

# Add XDC constraints
#add_files -fileset constrs_1 ./pynq_z1.xdc
add_files -fileset constrs_1 ./pynq_z1.xdc

# Set top module
# set_property top led_blink [get_filesets sources_1]
set_property top led_blink [current_fileset]

# Run synthesis
launch_runs synth_1 -jobs 4
wait_on_run synth_1

# Run implementation
# launch_runs impl_1 -jobs 4
# wait_on_run impl_1

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# Write the bitstream to file explicitly
# open_run impl_1
# write_bitstream -force ./led_project/led_blink.bit


# set_property PROBES.FILE {} [get_hw_devices xc7z020_1]
# set_property FULL_PROBES.FILE {} [get_hw_devices xc7z020_1]
# set_property PROGRAM.FILE {C:/Users/Administrator/project_1/project_1.runs/impl_1/main.bit} [get_hw_devices xc7z020_1]
# program_hw_devices [get_hw_devices xc7z020_1]
# refresh_hw_device [lindex [get_hw_devices xc7z020_1] 0]

# Open hardware manager
open_hw_manager
connect_hw_server

# Find the first hardware device
open_hw_target


set_property PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property PROGRAM.FILE {./led_project/led_project.runs/impl_1/led_blink.bit} [get_hw_devices xc7z020_1]
program_hw_devices [get_hw_devices xc7z020_1]

exit
