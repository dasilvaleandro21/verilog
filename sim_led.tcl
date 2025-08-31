# Create a simulation project
create_project sim_led ./sim_led -part xc7z020clg400-1 -force

# Add source files
add_files -fileset sim_1 ./led_blink.v
add_files -fileset sim_1 ./tb_led_blink.v

# Set the simulation top
set_property top tb_led_blink [get_filesets sim_1]

# Launch RTL simulation
launch_simulation