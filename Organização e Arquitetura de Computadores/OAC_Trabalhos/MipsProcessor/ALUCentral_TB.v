`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:10 01/19/2018
// Design Name:   ALUCentral
// Module Name:   /home/art/MipsProcessor/ALUCentral_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUCentral
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUCentral_TB;

	// Inputs
	reg [31:0] dado_1;
	reg [31:0] dado_2;
	reg [3:0] ALUControl;

	// Outputs
	wire zero;
	wire [31:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	ALUCentral uut (
		.dado_1(dado_1), 
		.dado_2(dado_2), 
		.ALUControl(ALUControl), 
		.zero(zero), 
		.ALUResult(ALUResult)
	);

	initial begin
		// Initialize Inputs
		dado_1 = 3;
		dado_2 = 3;
		ALUControl = 6;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		$monitor("dado1=%d", dado_1,"dado_2",dado_2,"Zero =",zero, "AluControl=",ALUControl, "ALUResult=",ALUResult);
		
		#10 ALUControl = 2;
		#10 dado_1 = 2;

	end
      
endmodule

