`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:54:55 01/20/2018
// Design Name:   mux_Mem_To_Reg
// Module Name:   /home/art/MipsProcessor/mux_Mem_To_Reg_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_Mem_To_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_Mem_To_Reg_TB;

	// Inputs
	reg [31:0] read_data;
	reg [31:0] ALUResult;
	reg controle;

	// Outputs
	wire [31:0] escrita_dado;

	// Instantiate the Unit Under Test (UUT)
	mux_Mem_To_Reg uut (
		.read_data(read_data), 
		.ALUResult(ALUResult), 
		.controle(controle), 
		.escrita_dado(escrita_dado)
	);

	initial begin
		// Initialize Inputs
		read_data = 0;
		ALUResult = 0;
		controle = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor();

	end
      
endmodule

