--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:24:10 11/24/2024
-- Design Name:   
-- Module Name:   D:/OmarKhaled/OmarKhaled222000009/memo_test.vhd
-- Project Name:  OmarKhaled222000009
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memo_test IS
END memo_test;
 
ARCHITECTURE behavior OF memo_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memo
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         MemWrite : IN  std_logic;
         MemRead : IN  std_logic;
         CLK : IN  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memo PORT MAP (
          Address => Address,
          WriteData => WriteData,
          MemWrite => MemWrite,
          MemRead => MemRead,
          CLK => CLK,
          ReadData => ReadData
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Address <= X"00000000";
		MemRead <= '1';
		MemWrite <='0';
		wait for 100 ns;
		Address <= X"00000004";
		MemRead <='0';
		MemWrite <='1';
		WriteData <=X"FFFFFFFF";
		wait for 100 ns;
		Address <= X"00000004";
		MemRead <='1';
		MemWrite<='0';
		wait;
		
   end process;

END;
