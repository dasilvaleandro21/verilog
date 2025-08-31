`timescale 1ns/1ps
`include "led_blink.v"  // for iverilog simulation only

module tb_led_blink;

  // Testbench signals
  reg sysclk;
  wire [3:0] led;

  // Instantiate DUT
  led_blink uut (
    .sysclk(sysclk),
    .led(led)
  );

  // Clock generator: 125 MHz = 8 ns period
  initial sysclk = 0;
  always #4 sysclk = ~sysclk;  // Toggle every 4 ns

  // Run simulation
  initial begin
    // Run for some time and dump waveform
    $dumpfile("led_blink.vcd");  // for GTKWave if needed
    $dumpvars(0, tb_led_blink);
    $monitor("Time: %0dns, LED: %b", $time, led);

    #1000;   // Run for 1us
    $finish;
  end

endmodule
