`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:46:43 01/20/2018
// Design Name:   InstructionMemory
// Module Name:   /home/art/MipsProcessor/InstructionMemory_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_TB;

	// Inputs
	reg [31:0] read_address;
	reg			clock;
	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.read_address(read_address),
		.clock(clock),
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		read_address = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		  $monitor("read_addres%b", read_address, "instruction= %b", instruction);
		  
		 # 10 read_address = 2;
		  
		// Add stimulus here

	end
      
endmodule

