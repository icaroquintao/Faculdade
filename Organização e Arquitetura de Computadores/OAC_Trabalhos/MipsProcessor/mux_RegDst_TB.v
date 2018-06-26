`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:33 01/13/2018
// Design Name:   mux_RegDst
// Module Name:   /home/art/MipsProcessor/mux_RegDst_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_RegDst
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_RegDst_TB;

	// Inputs
	reg [4:0] instrucao20_16;
	reg [4:0] instrucao15_11;
	reg controle;

	// Outputs
	wire [4:0] escrita_registrador;

	// Instantiate the Unit Under Test (UUT)
	mux_RegDst uut (
		.instrucao20_16(instrucao20_16), 
		.instrucao15_11(instrucao15_11), 
		.controle(controle), 
		.escrita_registrador(escrita_registrador)
	);

	initial begin
		// Initialize Inputs
		instrucao20_16 = 0;
		instrucao15_11 = 4'b1010;
		controle = 0;

		$monitor("instrucao20_16= %b",instrucao20_16,"instrucao15_11= %b",instrucao15_11,"controle= %b",controle,"escrita_registrador= %b",escrita_registrador);
	
		#10 controle = 1'b1;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

