----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:21 11/03/2024 
-- Design Name: 
-- Module Name:    shifter_26_28 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter_26_28 is
    Port ( A : in  STD_LOGIC_VECTOR (25 downto 0);
           B : out  STD_LOGIC_VECTOR (27 downto 0));
end shifter_26_28;

architecture Behavioral of shifter_26_28 is

begin
B(27 downto 2)<= A(25 downto 0);
B(1 downto 0)<="00";

end Behavioral;

