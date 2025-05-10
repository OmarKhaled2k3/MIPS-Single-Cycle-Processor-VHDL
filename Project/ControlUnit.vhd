----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:48 12/01/2024 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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
entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

process(Op)
begin
if Op ="000000" then --R-format
			RegDst<='1';
			AluSrc<='0';
			MemtoReg <='0';
			RegWrite <='1';
			MemRead <='0';
			MemWrite <='0';
			Branch <='0';
			ALUOp1 <='1';
			ALUOp0 <='0';
elsif Op = "100011" then --lw
			RegDst<='0';
			AluSrc <='1';
			MemtoReg<='1';
			RegWrite <='1';
			MemRead <='1';
			MemWrite <='0';
			Branch <='0';
			ALUOp1 <='0';
			ALUOp0 <='0';
elsif Op = "101011" then --sw
			--RegDst<='0';
			AluSrc <='1';
			--MemtoReg<='1';
			RegWrite <='0';
			MemRead <='0';
			MemWrite <='1';
			Branch <='0';
			ALUOp1 <='0';
			ALUOp0 <='0';
elsif Op = "000100" then --beq
			--RegDst<='0';
			AluSrc <='0';
			--MemtoReg<='1';
			RegWrite <='0';
			MemRead <='0';
			MemWrite <='0';
			Branch <='1';
			ALUOp1 <='0';
			ALUOp0 <='1';
end if;
end process;
end Behavioral;

