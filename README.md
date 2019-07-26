#Cmod S6
This repository contains VHDL files for various projects with the Cmod S6 FPGA and Xilinx ISE.

This is purely intended for learning purposes to get started with VHDL for a research project centered around the construction of an 8-bit flash ADC.

Currently there are only two basic project in here.
The first one is the LED_Blink project, and the second one is the LED_Count project.

Each of these directories contains the necessary source code files to program the FPGA using Xilinx ISE.  They also contain the binary files for direct use Impact if you desire to program the FPGA immediately.

The LED_Blink project gets the 4 LEDs to flash in a cool pattern at a visible rate of 1Hz by downscaling the onboard 8MHz clock signal.

The LED_Count project implements a 4 bit binary counter that gets displayed onto the 4 LEDs using a 1Hz clock signal obtained from the 8MHz clock through the use of the same downscaling process from the LED_Blink project.
This counter is able to count up from 0 to 15, and down from 15 to 0.  This is done through the use of pushbutton 0.
When pushbutton 0 is not pressed, the counter operates in the forward direction and counts up to 15.  Once 15 is reached, the counter resets to 0 and runs again automatically as the 4 bit limit has been reached.
When pushbutton 0 is pressed, the counter operates in the reverse direction and counts down to 0 from whatever value it is currently at.  Once 0 is reached, the counter resets to 15 and runs again automatically.
Note: Given how the states of the pushbuttons work, pushbutton 0 must be held down continuously in order for the counter to count down.  Once it is released, the counter will start counting up again.

Feel free to download and modify these files to alter the functionality of these projects to whatever you want.