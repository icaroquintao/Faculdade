`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:19 01/19/2018
// Design Name:   Shift_Left_2_32
// Module Name:   /home/art/MipsProcessor/Shift_Left_2_32_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift_Left_2_32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shift_Left_2_32_TB;

	// Inputs
	reg [31:0] signal;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shift_Left_2_32 uut (
		.signal(signal), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		signal = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor("sinal entrada=%b", signal, "sinal saida=%b", out);
		
		#10 signal = 20;
		

	end
      
endmodule

