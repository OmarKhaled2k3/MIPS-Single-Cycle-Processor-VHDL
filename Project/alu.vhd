----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:24 10/20/2024 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_CONTROL : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_RESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ZERO : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal resultX: STD_LOGIC_VECTOR (31 downto 0);
begin
process(A,B,ALU_CONTROL)
begin

CASE ALU_CONTROL is
when "0000" => resultX <= A and B;
when "0001" => resultX <= A or B;
when "0010" => resultX <= A + B;
when "0110" => resultX <= A - B;

when "0111" => 
if A< B then resultX<=X"00000001";
else resultX<=X"00000000";
end if;

when "1100" => resultX<= A nor B;
when others => null;
resultX<=X"00000000";
end case;
end process;

zero <= '1' WHEN resultX=X"00000000" else '0';
ALU_RESULT<=resultX;
end Behavioral;

