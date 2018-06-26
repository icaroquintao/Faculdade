`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:34 01/13/2018 
// Design Name: 
// Module Name:    ALUPc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALUPc(
		pc,
		out
	);


//  SOMA +4 OU +1 ? 
	input wire[31:0] pc;
	output reg[31:0] out;
	
	always @ (pc)
		begin
			out = pc + 1;
		end

endmodule
