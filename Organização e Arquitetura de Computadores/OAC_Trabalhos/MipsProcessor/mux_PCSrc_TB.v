`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:32:44 01/13/2018
// Design Name:   mux_PCSrc
// Module Name:   /home/art/MipsProcessor/mux_PCSrc_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_PCSrc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
dddddddddddddddddddddddddddddddddddddddddddddddddddd
*/



module mux_PCSrc_TB;

	// Inputs
	reg [31:0] add_result;
	reg [31:0] pc4;
	reg controle;

	// Outputs
	wire [31:0] saida_proximo_mux;

	// Instantiate the Unit Under Test (UUT)
	mux_PCSrc uut (
		.add_result(add_result), 
		.pc4(pc4), 
		.controle(controle), 
		.saida_pc(saida_proximo_mux)
	);

	initial begin
		// Initialize Inputs
		add_result = 1111;
		pc4 = 1010;
		controle = 0;

		$monitor("add_result= %b", add_result, "pc4=%b",pc4 ,"controle=%b",controle ,"saida_pc=%b",saida_proximo_mux );

		#10 controle = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

