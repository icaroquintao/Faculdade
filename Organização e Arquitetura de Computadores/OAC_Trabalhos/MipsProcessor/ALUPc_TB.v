`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:12:28 01/19/2018
// Design Name:   ALUPc
// Module Name:   /home/art/MipsProcessor/ALUPc_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUPc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUPc_TB;

	// Inputs
	reg [31:0] pc;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALUPc uut (
		.pc(pc), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		  $monitor("pc=%d",pc,"saida=",out);
		  
		  #10 pc = 2;
		  #10 pc = 3;
		// Add stimulus here

	end
      
endmodule

