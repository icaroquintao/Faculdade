`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:58 01/13/2018
// Design Name:   mux_PC4
// Module Name:   /home/art/MipsProcessor/mux_PC4_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_PC4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_PC4_TB;

	// Inputs
	reg [31:0] jump_address;
	reg [31:0] saida_mux_PCSrc;
	reg controle;

	// Outputs
	wire [31:0] saida_pc;

	// Instantiate the Unit Under Test (UUT)
	mux_PC4 uut (
		.jump_address(jump_address), 
		.saida_mux_PCSrc(saida_mux_PCSrc), 
		.controle(controle), 
		.saida_pc(saida_pc)
	);

	initial begin
		// Initialize Inputs
		jump_address = 1012;
		saida_mux_PCSrc = 44;
		controle = 0;
	
		$monitor("jump_address =",jump_address, " saida_mux_PCSrc= ",saida_mux_PCSrc, "controle = ",controle, " saida_pc= ",saida_pc);

		#10 controle = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		  
		  
		// Add stimulus here

	end
      
endmodule

