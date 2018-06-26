`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:04:47 01/22/2018
// Design Name:   soma_jump
// Module Name:   /home/art/Trab_OAC/soma_jump_TB.v
// Project Name:  Trab_OAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: soma_jump
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module soma_jump_TB;

	// Inputs
	reg [27:0] sinal28;

	// Outputs
	wire [31:0] saida32;

	// Instantiate the Unit Under Test (UUT)
	soma_jump uut (
		.sinal28(sinal28), 
		.saida32(saida32)
	);

	initial begin
		// Initialize Inputs
		sinal28 = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		  $monitor("sinal28 = %b", sinal28, "\nsinal32 = %b", saida32);
		// Add stimulus here

	end
      
endmodule

