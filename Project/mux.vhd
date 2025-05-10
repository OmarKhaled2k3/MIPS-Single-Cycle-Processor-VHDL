----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:23 10/13/2024 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
generic(N: integer :=32);

port(
A:in std_logic_vector(N-1 downto 0);
B:in std_logic_vector(N-1 downto 0);
sel:in std_logic;
Y:out std_logic_vector(N-1 downto 0)
);

end mux;

architecture Behavioral of mux is

begin
process(A,B,sel)
begin
if sel ='0' then
Y<=A;
else
Y<=B;
end if;
end process;
end Behavioral;

