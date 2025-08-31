# Open hardware manager
open_hw_manager
connect_hw_server

# Find the first hardware device
open_hw_target
current_hw_device [lindex [get_hw_devices] 1]

# Program the bitstream
program_hw_devices [current_hw_device] "./led_project/led_project.runs/impl_1/main.bit"

# Close
close_hw_manager
exit


set_property PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property PROGRAM.FILE {C:/Users/Administrator/project_1/project_1.runs/impl_1/main.bit} [get_hw_devices xc7z020_1]
set_property PROGRAM.FILE {./led_project/led_project.runs/impl_1/main.bit} [get_hw_devices xc7z020_1]
program_hw_devices [get_hw_devices xc7z020_1]

