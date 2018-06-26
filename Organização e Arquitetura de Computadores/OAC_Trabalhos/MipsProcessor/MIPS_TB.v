`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:01 01/20/2018 
// Design Name: 
// Module Name:    MIPS_TB 
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
module MIPS_TB;

// INSTANCIACAO DE TODAS AS VARIAVEIS NECESSARIAS
// PARA A UTILIZAÇÃO DO SISTEMA

// INSTANCIACAO DO CLOCK
	wire clock;
	
// PC
	wire [31:0] new_pc;
	wire [31:0] saida_pc;

// INSTRUCTION MEMORY
	wire [31:0] 	instruction;
	
	
// SOMADOR PC
	wire [31:0] 	saida_somador_pc;
	
// SINAIS UNIDADE DE CONTROLE

	wire	[5:0]		opcode;
	wire	[1:0]		ALUOp;
	wire				RegDst;
	wire				jump;
	wire				beq;
	wire				bne;
	wire				MemRead;
	wire				MemToReg;
	wire				MemWrite;
	wire				ALUSrc;
	wire				RegWrite;

// BANCO DE REGISTRADORES

	wire [4:0]	rs;
	wire [4:0]	rt;
	wire [4:0]	rd;
	wire [31:0]	RS;
	wire [31:0]	RT;
	wire [31:0]	write_data;


// ALU CONTROL

	wire [5:0]	funct;
	wire [3:0]	saida_p_ALU;
	// ALUop ja esta no controle


// ALU CENTRAL
	wire zero;
	wire zero_bne;
	wire [31:0]	ALUResult;
	
	
// DATA MEMORY

	wire [31:0] read_data;
	
// EXTERSOR DE SINAL

	wire [15:0] entrada_extensor_sinal;
	wire [31:0] saida_extensor_sinal;
	
// SHIFT 32/32 

	wire [31:0] saida_shift_32_32;

//	SOMADOR ALU NORTE
	wire [31:0]	saida_p_mux_jump;
	
// SHIFT 26/28

	wire [25:0] entrada_shift_26_28;
	wire [27:0] saida_shift_26_28;

// PORTA AND

	wire 			saida_porta_and;


// SAIDAS MUX

	wire	[4:0]		saida_mux_regDst;
	wire	[31:0] 	saida_mux_ALUSrc;
	wire	[31:0]	saida_mux_mem_to_reg;
	wire	[31:0]	saida_mux_PCSrc;
	wire	[31:0]	saida_mux_PC4;

// SOMA JUMP

	wire [31:0]		sinal32_jump;



// APOS A INSTANCIACAO DE TODAS AS VARIAVEIS QUE SERAO UTILIZADAS 
// AS VARIAVEIS QUE SAO RELACIONADAS SAO INTERLIGADAS


	assign opcode 						= instruction[31:26];
	assign rs	  						= instruction[25:21];
	assign rt	  						= instruction[20:16];
	assign rd	  						= instruction[15:11];
	assign funct						= instruction[5:0];
	assign entrada_shift_26_28 	= instruction[25:0];
	assign entrada_extensor_sinal = instruction[15:0];


// MONITORAMENTO DOS DADOS

// "--INSTRUCAO=%b",instruction,		"\nTIME=",$time,".....CLOCK=",clock, 		".....WRITE DATA = %d",saida_mux_mem_to_reg,

// "\tALUResult=",ALUResult, 		"\tMemWrite=",MemWrite, "\tMemRead=",MemRead

// "\tZero_beq=",zero,"\tZero_bne=",zero_bne,

//		"\tZero_beq=",zero,"\tZero_bne=",zero_bne,"","\tbeq",beq,"\tbne",bne,"


// ,"\tAND=",saida_porta_and				,"\trd=",rd

	initial begin

		// $monitor MONITORARA TODAS AS VARIACOES DAS VARIAVEIS
		$monitor("\nPC=",saida_pc,"\tOPCODE=",opcode,"\tFUNCT=",funct,"\trs=",rs,"\tvalor RS=",RS,"\trt=",rt,"\tvalor_RT=",RT,"\tConstante=",saida_extensor_sinal,"\tRegistrador Destino=",saida_mux_regDst,"\tDado Escrito no Registrador=",saida_mux_mem_to_reg);
		
		#500 $finish;
	end
	
	
	
	
	// INSTANCIACAO DOS MODULOS
	
	// CLOCK
	clock_gerador clk(clock);
	
	// PC
	PC pc(clock,saida_mux_PC4,saida_pc);
	
	// MEMORIA DE INSTRUCAO
	InstructionMemory im(saida_pc,clock, instruction);
	
	// SOMADOR PC
	ALUPc somador_pc(saida_pc, saida_somador_pc);
	
	// SHIFT 26 28
	
	Shif_Left_2 sl2(entrada_shift_26_28,saida_shift_26_28);
	
	// UNIDADE DE CONTROLE
	CONTROL inidade_de_controle ( 
		.opcode(opcode), 
		.branch_eq(beq), 
		.branch_ne(bne), 
		.ALUOp(ALUOp), 
		.memRead(MemRead), 
		.memWrite(MemWrite), 
		.memToReg(MemToReg), 
		.regDst(RegDst), 
		.regWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.jump(jump)
	);
	
	
	// BANCO DE REGISTRADORES
	Banco_Registradores banco_de_registradores (
		.regWrite(RegWrite), 
		.read_register_1(rs), 
		.read_register_2(rt), 
		.write_register(saida_mux_regDst), 
		.write_data(saida_mux_mem_to_reg), 
		.read_data_1(RS), 
		.read_data_2(RT)
	);
	
	
	// ALU CONTROL
	ALUControl alu_control(ALUOp, funct, saida_p_ALU);
	
	// ALU CENTRAL
	ALUCentral alu_central(RS,saida_mux_ALUSrc,saida_p_ALU,zero,zero_bne,ALUResult);
			
	// DATA MEMORY 
	DataMemory d_memory(MemWrite, ALUResult, RT, MemRead,read_data);
	
	// EXTENSOR SINAL
	extensor_sinal e_sinal(entrada_extensor_sinal,saida_extensor_sinal);
	
	// SHIFT 32/32
	Shift_Left_2_32 shift_32(saida_extensor_sinal, saida_shift_32_32);
		
	// SOMADOR ALU NORTE
	ALU_Norte somador_alu_norte(saida_shift_32_32,saida_somador_pc, saida_p_mux_jump );

	// PORTA AND beq
	portaAND p_and(beq,bne, zero,zero_bne, saida_porta_and);
	

	// MUX
	mux_ALUSrc mas(RT,saida_extensor_sinal,ALUSrc,saida_mux_ALUSrc);
	
	mux_mem_to_reg mmmr(read_data,ALUResult,MemToReg,saida_mux_mem_to_reg);
		
	mux_RegDst mrd(rt,rd,RegDst,saida_mux_regDst);

	mux_PCSrc mpcsrc(saida_p_mux_jump,saida_somador_pc,saida_porta_and, saida_mux_PCSrc);
	
	// EXTENSOR + SOMADOR JUMP
	soma_jump sj (	saida_shift_26_28, sinal32_jump);
	
	mux_PC4 mpc4(sinal32_jump,saida_mux_PCSrc,jump,saida_mux_PC4);



endmodule
