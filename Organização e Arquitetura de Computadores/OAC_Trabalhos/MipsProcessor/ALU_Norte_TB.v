`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:01:24 01/19/2018
// Design Name:   ALU_Norte
// Module Name:   /home/art/MipsProcessor/ALU_Norte_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Norte
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Norte_TB;

	// Inputs
	reg [31:0] sinal_shift;
	reg [31:0] pc;

	// Outputs
	wire [31:0] saida_mux;

	// Instantiate the Unit Under Test (UUT)
	ALU_Norte uut (
		.sinal_shift(sinal_shift), 
		.pc(pc), 
		.saida_mux(saida_mux)
	);

	initial begin
		// Initialize Inputs
		sinal_shift = 0;
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		$monitor("Sinal Shift = %d", sinal_shift, "pc = %d" ,pc, "saida_mux = %d", saida_mux);
		
		#10	sinal_shift = 10;
		# 10	pc = 10;
        
		// Add stimulus here

	end
      
endmodule

