`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:49:35 01/26/2018
// Design Name:   portaAND
// Module Name:   /home/art/Trab_OAC/portaAND_TB.v
// Project Name:  Trab_OAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: portaAND
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module portaAND_TB;

	// Inputs
	reg branch;
	reg branch_ne;
	reg zero;
	reg zero_bne;

	// Outputs
	wire resultado;

	// Instantiate the Unit Under Test (UUT)
	portaAND uut (
		.branch(branch),
		.branch_ne(branch_ne),
		.zero(zero), 
		.zero_bne(zero_bne), 
		.resultado(resultado)
	);

	initial begin
		// Initialize Inputs
		branch = 1;
		branch_ne = 0;
		zero = 1;
		zero_bne = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		$monitor("Branch_ne",branch_ne,"zero=",zero,"\tzero bne = ",zero_bne,"\tbranch", branch, "\tresultado = ", resultado);
       
		// #1 branch = 1;
		  
		  
		// Add stimulus here

	end
      
endmodule

