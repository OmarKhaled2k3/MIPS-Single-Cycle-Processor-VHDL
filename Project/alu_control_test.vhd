--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:08:22 10/27/2024
-- Design Name:   
-- Module Name:   D:/OmarKhaled/OmarKhaled222000009/alu_control_test.vhd
-- Project Name:  OmarKhaled222000009
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUOP
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
 
ENTITY alu_control_test IS
END alu_control_test;
 
ARCHITECTURE behavior OF alu_control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUOP
    PORT(
         func : IN  std_logic_vector(5 downto 0);
         opcode : IN  std_logic_vector(1 downto 0);
         op : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal func : std_logic_vector(5 downto 0) := (others => '0');
   signal opcode : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal op : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUOP PORT MAP (
          func => func,
          opcode => opcode,
          op => op
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
     
		opcode<="00"; wait for 100 ns;
		opcode<="01"; wait for 100 ns;
		func<="100000";opcode<="10"; wait for 100 ns;
		func<="100010";opcode<="10"; wait for 100 ns;
		func<="100100";opcode<="10"; wait for 100 ns;
		func<="100101";opcode<="10"; wait for 100 ns;
		func<="101010";opcode<="10"; wait for 100 ns;
      wait;
   end process;

END;
