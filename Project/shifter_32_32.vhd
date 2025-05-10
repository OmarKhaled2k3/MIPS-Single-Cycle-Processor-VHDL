----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:24 11/03/2024 
-- Design Name: 
-- Module Name:    shifter_32_32 - Behavioral 
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

entity shifter_32_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end shifter_32_32;

architecture Behavioral of shifter_32_32 is

begin
B(31 downto 2)<=A(29 downto 0);
B(1 downto 0)<="00";

end Behavioral;

