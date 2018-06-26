`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:03:33 01/13/2018
// Design Name:   extensor_sinal
// Module Name:   /home/art/MipsProcessor/extensor_sinal_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: extensor_sinal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module extensor_sinal_TB;

	// Inputs
	reg [15:0] sinal_16;

	// Outputs
	wire [31:0] sinal_32;

	// Instantiate the Unit Under Test (UUT)
	extensor_sinal uut (
		.sinal_16(sinal_16), 
		.sinal_32(sinal_32)
	);

	initial begin
		// Initialize Inputs
		sinal_16 = 16'b0;
		
		$monitor("sinal 16 = %b", sinal_16, "\nsinal_32 = %b", sinal_32);

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

