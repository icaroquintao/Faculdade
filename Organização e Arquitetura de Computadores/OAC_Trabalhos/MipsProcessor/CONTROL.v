`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:56 01/13/2018 
// Design Name: 
// Module Name:    CONTROL 
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
module CONTROL(
	opcode,
	branch_eq,
	branch_ne,
	ALUOp,
	memRead,
	memWrite,
	memToReg,
	regDst,
	regWrite,
	ALUSrc,
	jump     );
	
	
	input wire[5:0]	opcode;
	output reg			branch_eq;
	output reg			branch_ne;
	output reg[1:0]	ALUOp;
	output reg			memRead;
	output reg			memWrite;
	output reg			memToReg;
	output reg			regDst;
	output reg			regWrite;
	output reg			ALUSrc;
	output reg			jump;   
	
	always @(opcode) 
		begin
				case (opcode)
						6'b100011: begin	/* lw    35*/
							memRead  <= 1'b1;
							regDst   <= 1'b0;
							memToReg <= 1'b1;
							ALUOp 	<= 2'b00;
							ALUSrc   <= 1'b1;
							regWrite <= 1'b1;
						end
						
						6'b001000: begin	/* addi    8*/
							regDst   <= 1'b0;
							ALUOp[1] <= 1'b0;
							ALUSrc   <= 1'b1;
							regWrite = 1'b1;
						end
						
						
						6'b000100: begin	/* beq  4 */
							ALUOp[0]  <= 1'b1;
							ALUOp[1]  <= 1'b0;
							branch_eq <= 1'b1;
							regWrite  <= 1'b0;
							branch_ne<=	 1'b0;
						end
						
						
						6'b101011: begin	/* sw   43*/
							memWrite <= 1'b1;
							ALUOp		<= 2'b00;
							ALUSrc   <= 1'b1;
							regWrite <= 1'b0;
						end
						
						6'b000101: begin	/* bne    5*/
							ALUOp[0]  <= 1'b1;
							ALUOp[1]  <= 1'b0;
							branch_eq <= 1'b0;
							branch_ne <= 1'b1;
							regWrite  <= 1'b0;
						end
						
						
					6'b001010: begin	/* slti     10 */
							ALUOp[1] <= 1'b1;
							regDst   <= 1'b0;
							ALUSrc   <= 1'b1;
							regWrite = 1'b1;
					end
					
					6'b000000: begin	/* add     0*/
					
						ALUOp		   <= 2'b10;
						ALUSrc		<= 1'b0;
						branch_eq	<= 1'b0;
						branch_ne	<= 1'b0;
						memRead		<= 1'b0;
						memToReg	   <= 1'b0;
						memWrite	   <= 1'b0;
						regDst		<= 1'b1;
						regWrite	   <= 1'b1;
						jump			<= 1'b0;
						
					end
					
					
					6'b000010: begin	/* j jump     2  */
							jump <= 1'b1;
					end
		endcase
	end

endmodule
