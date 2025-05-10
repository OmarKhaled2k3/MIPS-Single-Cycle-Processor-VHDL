----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:02 12/21/2024 
-- Design Name: 
-- Module Name:    instruction_memo - Behavioral 
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

entity instruction_memo is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memo;

architecture Behavioral of instruction_memo is

type Memory is array(0 to 23) of STD_LOGIC_VECTOR(7 downto 0);
signal MM:Memory := (
X"00",X"85",X"10",X"20",  -- add $v0, $a0, $a1
X"AC",X"02",X"00",X"08",  -- sw $v0, 8($zero)
X"8C",X"06",X"00",X"08",  -- lw $a2, 8($zero)
X"10",X"46",X"00",X"01",  -- beq $v0, $a2, Good_Processor
X"00",X"46",X"88",X"2A",  -- slt $s1, $v0, $a2
X"00",X"A4",X"88",X"22"); -- Good_Processor: sub $s1, $a1, $a0
begin
	process(Address)
	begin
		Instruction(31 downto 24) <= MM(to_integer(unsigned(Address)));
		Instruction(23 downto 16) <= MM(to_integer(unsigned(Address))+1);
		Instruction(15 downto 8) <= MM(to_integer(unsigned(Address))+2);
		Instruction(7 downto 0) <= MM(to_integer(unsigned(Address))+3);
		end process;
end Behavioral;