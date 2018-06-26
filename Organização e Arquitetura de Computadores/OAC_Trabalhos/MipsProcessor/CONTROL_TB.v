`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:24 01/19/2018
// Design Name:   CONTROL
// Module Name:   /home/art/MipsProcessor/CONTROL_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CONTROL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CONTROL_TB;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire branch_eq;
	wire branch_ne;
	wire [1:0] ALUOp;
	wire memRead;
	wire memWrite;
	wire memToReg;
	wire regDst;
	wire regWrite;
	wire ALUSrc;
	wire jump;

	// Instantiate the Unit Under Test (UUT)
	CONTROL uut (
		.opcode(opcode), 
		.branch_eq(branch_eq), 
		.branch_ne(branch_ne), 
		.ALUOp(ALUOp), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.memToReg(memToReg), 
		.regDst(regDst), 
		.regWrite(regWrite), 
		.ALUSrc(ALUSrc), 
		.jump(jump)
	);

	initial begin
		// Initialize Inputs
		opcode = 6'b000010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor("opcode = ",opcode,	"branch_eq = ",branch_eq, "branch_ne = "	,branch_ne, "ALUOp = ",	ALUOp, "memRead = ",	memRead, "\nmemWrite = ",	memWrite, "memToReg =",memToReg, "regDst = " ,	regDst, "regWrite = ",regWrite, 	"ALUSrc = ",ALUSrc, "jump = ",	jump );

	end
      
endmodule

