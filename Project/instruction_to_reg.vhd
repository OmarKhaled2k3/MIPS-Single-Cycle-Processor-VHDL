----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:31 12/21/2024 
-- Design Name: 
-- Module Name:    instruction_to_reg - Behavioral 
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

entity instruction_to_reg is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           RegDst : in  STD_LOGIC;
           RegWrite : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end instruction_to_reg;

architecture Behavioral of instruction_to_reg is
--componenets
component Registers is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end component;

component mux is
generic(N: integer :=32);

port( A:in std_logic_vector(N-1 downto 0);
		B:in std_logic_vector(N-1 downto 0);
		sel:in std_logic;
		Y:out std_logic_vector(N-1 downto 0)
);
end component;

--signals
signal out_mux : STD_LOGIC_VECTOR(4 downto 0);

begin

--port mapping
mux1 : mux generic map(N =>5) port map(Instruction(20 downto 16),Instruction(15 downto 11), RegDst , out_mux);

register_file : Registers port map ( Instruction (25 downto 21),Instruction (20 downto 16),out_mux,WriteData,ReadData1,ReadData2,RegWrite,clk);

end Behavioral;

