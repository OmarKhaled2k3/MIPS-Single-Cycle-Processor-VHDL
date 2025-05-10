----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:48 11/17/2024 
-- Design Name: 
-- Module Name:    Registers - Behavioral 
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

entity Registers is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end Registers;

architecture Behavioral of Registers is
type regArray is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal regfile: regArray :=(
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000005", X"00000007", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000",
X"00000000", X"00000000", X"00000000", X"00000000"
);
begin
ReadData1 <= regfile (TO_INTEGER (UNSIGNED (ReadReg1)));
ReadData2 <= regfile (TO_INTEGER (UNSIGNED (ReadReg2)));
PROCESS (WriteData, RegWrite, CLK)
BEGIN

IF RegWrite = '1' AND RISING_EDGE(CLK) THEN
regfile (TO_INTEGER (UNSIGNED(WriteReg))) <= WriteData;
END IF;
END PROCESS;
end Behavioral;

