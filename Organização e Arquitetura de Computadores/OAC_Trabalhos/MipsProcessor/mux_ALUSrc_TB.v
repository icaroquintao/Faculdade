`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:36 01/13/2018
// Design Name:   mux_ALUSrc
// Module Name:   /home/art/MipsProcessor/mux_ALUSrc_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_ALUSrc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_ALUSrc_TB;

	// Inputs
	reg [31:0] read_data2;
	reg [31:0] extensor_sinal;
	reg controle;

	// Outputs
	wire [31:0] saida_para_ALU;

	// Instantiate the Unit Under Test (UUT)
	mux_ALUSrc uut (
		.read_data2(read_data2), 
		.extensor_sinal(extensor_sinal), 
		.controle(controle), 
		.saida_para_ALU(saida_para_ALU)
	);

	initial begin
		// Initialize Inputs
		read_data2 = 10101111;
		extensor_sinal = 0;
		controle = 1;

		$monitor( "read_data2 = %b", read_data2,"extensor_sinal=%b",extensor_sinal, "controle= %b", controle, "saida_para_ALU=%b",saida_para_ALU );

		#10 controle = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

