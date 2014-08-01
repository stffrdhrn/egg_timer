# _Egg Timer_

_Description: _ 

The `egg_timer` module counts to a specified max value then flashes LEDs to indicate
that is has reached the max value.  There are two control buttons Reset and Start. 
There is a max count input of 4-bits (parameterized) used to control when the alarm 
should go off.  There are 4-bit outputs (parameterized) to display the current count. 

The input signal of the egg_timer module is expected to be 1Mhz.  Internal counters are
used to make alarm counting 1 second.

Basic operation on De0 Nano
  - Set the dip switches to the desired time. 
  - Click the reset push button to zero the output
  - Click the start push button to start the counting
  - Wait for alarm
  - To start again you must hit reset

## Project Status
  - Compiles
  - Have test bench for simulating
  - I have tested it and confirm in FPGA on the De0 Nano

## TODO

## Project Setup
This project has been developed with quartus II. 

## License
BSD
