`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:14 01/13/2018
// Design Name:   clock_gerador
// Module Name:   /home/art/MipsProcessor/clock_gerador_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_gerador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_gerador_TB;

	// Outputs
	wire saida;

	// Instantiate the Unit Under Test (UUT)
	clock_gerador uut (
		.saida(saida)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
		
		$monitor("time = %d",$time, "clk = ", saida);
        
		//$finish
		// Add stimulus here

	end
      
endmodule

