`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:55:57 01/13/2018
// Design Name:   PC
// Module Name:   /home/art/MipsProcessor/PC_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_TB;

	// Inputs
	reg clock;
	reg [31:0] new_pc;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clock(clock), 
		.new_pc(new_pc), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		new_pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		$monitor("time = ", $time, "clock = %b", clock, "out = ", out);
		//clock = ~clock;
		// Add stimulus here
		#1 clock = 1;
			new_pc = 1;
			//clock = 0;
		#1 new_pc = 2;
			clock = 0;
			
		#1 new_pc = 3;
			clock = 1;

	end
      
endmodule

