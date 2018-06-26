`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:38 01/13/2018
// Design Name:   Shif_Left_2
// Module Name:   /home/art/MipsProcessor/Shift_Left_2_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shif_Left_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shift_Left_2_TB;

	// Inputs
	reg [25:0] signal;

	// Outputs
	wire [27:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shif_Left_2 uut (
		.signal(signal), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		signal = 1111;
		
		$monitor("sinal-00 = %b", signal, "\nsinal-01 = %b", out);
		
		signal = 1010;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

