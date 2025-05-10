----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:52 12/22/2024 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MIPS is
    Port ( CLK : in  STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is

--PC
component PC is
    Port ( clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--Instruction_to_Reg
component instruction_to_reg is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           RegDst : in  STD_LOGIC;
           RegWrite : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

--Adder32
component  Adder_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sum : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;

--Control Unit
component  ControlUnit is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC);
end component ;



--ALU
component alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_CONTROL : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_RESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ZERO : out  STD_LOGIC);
end component;

-- ALUControl
component  ALUOP is
    Port ( func : in  STD_LOGIC_VECTOR (5 downto 0);
           opcode : in  STD_LOGIC_VECTOR (1 downto 0);
           op : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


-- Instruction memory
component instruction_memo is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--Data Memory
component memo is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--Shifter 26-28
component  shifter_26_28 is
    Port ( A : in  STD_LOGIC_VECTOR (25 downto 0);
           B : out  STD_LOGIC_VECTOR (27 downto 0));
end component ;

--Shifter 32-32
component shifter_32_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--Sign_extend
component sign_extend is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--Mux
component mux is
generic(N: integer :=32);

port( A:in std_logic_vector(N-1 downto 0);
		B:in std_logic_vector(N-1 downto 0);
		sel:in std_logic;
		Y:out std_logic_vector(N-1 downto 0)
);
end component;

--Signals Declaration
signal pc4 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal BranchALUOutput : STD_LOGIC_VECTOR(31 downto 0);
signal pc_address_inp : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal pc_address_outp : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal BranchAndZero : STD_LOGIC ;
signal InstructionOutput : STD_LOGIC_VECTOR(31 downto 0);
signal RegDst,AluSrc,MemtoReg,RegWrite,MemRead,MemWrite,ALUOp1,ALUOp0 : STD_LOGIC;
signal WriteDatatoReg : STD_LOGIC_VECTOR(31 downto 0);
signal ReadData1,ReadData2 : STD_LOGIC_VECTOR (31 downto 0);
signal Ins_SignExtend_Out  : STD_LOGIC_VECTOR (31 downto 0);
signal Mux_Reg_Out  : STD_LOGIC_VECTOR (31 downto 0);
signal Shiftleft2ALU  : STD_LOGIC_VECTOR (31 downto 0);
signal OperationtoALU: STD_LOGIC_VECTOR (3 downto 0);
signal ALUoutput :  STD_LOGIC_VECTOR (1 downto 0);
signal ALUResult: STD_LOGIC_VECTOR (31 downto 0);
signal Zero :STD_LOGIC;
signal Branch :STD_LOGIC;
signal DataMemoryOutput :STD_LOGIC_VECTOR (31 downto 0); --


begin
-- port mapping
adder4 : Adder_32 port map(pc_address_outp,X"00000004",pc4);
muxpc: mux generic map (N=>32) port map (pc4,BranchALUOutput,BranchAndZero,pc_address_inp);
PCI :  PC port map(CLK,pc_address_inp ,pc_address_outp);


InstructionMemo: instruction_memo  port map(pc_address_outp,InstructionOutput);
Control: ControlUnit port map(InstructionOutput(31 downto 26),RegDst,AluSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUoutput(1),ALUoutput(0));
InstReg: instruction_to_reg port map(InstructionOutput,RegDst,RegWrite,WriteDatatoReg,ReadData1,ReadData2,CLK);

InsSignExtend: sign_extend port map(InstructionOutput(15 downto 0) ,Ins_SignExtend_Out);
muxreg: mux generic map (N=>32) port map (ReadData2,Ins_SignExtend_Out,AluSrc,Mux_Reg_Out);
Shifter_Inst_SignExtend : shifter_32_32 port map (Ins_SignExtend_Out,Shiftleft2ALU);
PCShiftLeftAdd : Adder_32 port map(pc4,Shiftleft2ALU,BranchALUOutput);

AluControl : ALUOP port map(InstructionOutput(5 downto 0) ,ALUoutput,OperationtoALU);
ALUafterReg : alu port map(ReadData1,Mux_Reg_Out,OperationtoALU,ALUResult,Zero);
BranchAndZero <= Branch AND Zero;

DataMemory : memo port map(ALUResult,ReadData2,MemWrite,MemRead,CLK,DataMemoryOutput); --
MuxAfterMemory : mux generic map (N=>32) port map (ALUResult,DataMemoryOutput,MemtoReg,WriteDatatoReg); --
end Behavioral;

