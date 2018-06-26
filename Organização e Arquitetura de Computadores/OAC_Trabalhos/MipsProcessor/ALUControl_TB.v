`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:58:37 01/19/2018
// Design Name:   ALUControl
// Module Name:   /home/art/MipsProcessor/ALUControl_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUControl_TB;

	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] funct;

	// Outputs
	wire [3:0] saida_p_ALU;

	// Instantiate the Unit Under Test (UUT)
	ALUControl uut (
		.ALUOp(ALUOp), 
		.funct(funct), 
		.saida_p_ALU(saida_p_ALU)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 00;
		funct = 6'b000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		

		$monitor("ALU OP %b= ",ALUOp,"Funct = %b",funct, "Saida_ALU = %b", saida_p_ALU);



	end
      
endmodule

