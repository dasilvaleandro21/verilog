`timescale 1ns / 1ps

module led_blink (
    input  wire        sysclk,               // your 125 MHz fabric clock
    output reg  [3:0]  led      // 4 LEDs from base.xdc
);

  // 27-bit counter: bit[26] toggles at roughly 125 MHz / 2^27 ? 0.93 Hz
  reg [26:0] counter = 0;

  always @(posedge sysclk) begin
    counter <= counter + 1;
    // Blink LED0, keep others off
//    led[0] <= counter[26];
    led[0] <= counter[24];
    led[1] <= counter[25];
    led[2] <= counter[26];
    led[3] <= 1'b0;
  end

endmodule