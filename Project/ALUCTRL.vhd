----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:10 10/27/2024 
-- Design Name: 
-- Module Name:    ALUOP - Behavioral 
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

entity ALUOP is
    Port ( func : in  STD_LOGIC_VECTOR (5 downto 0);
           opcode : in  STD_LOGIC_VECTOR (1 downto 0);
           op : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUOP;

architecture Behavioral of ALUOP is

begin
process(opcode,func)
begin
if opcode ="00" then op<="0010"; -- load ad store
elsif opcode = "01" then op<="0110"; -- branch
elsif opcode = "10" and func = "100000" then op<="0010"; -- add
elsif opcode = "10" and func = "100010" then op<="0110"; -- sub
elsif opcode = "10" and func = "100100" then op<="0000"; -- and
elsif opcode = "10" and func = "100101" then op<="0001"; -- or
elsif opcode = "10" and func = "101010" then op<="0111"; -- set
end if;
end process;

end Behavioral;

