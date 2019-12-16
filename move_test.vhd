--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:44:44 12/04/2019
-- Design Name:   
-- Module Name:   C:/Users/altan/FPGA/snake_game/move_test.vhd
-- Project Name:  snake_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: snake_move
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
 
ENTITY move_test IS
END move_test;
 
ARCHITECTURE behavior OF move_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT snake_move
    PORT(
         clk : IN  std_logic;
         direction : IN  std_logic_vector(1 downto 0);
         rows : OUT  std_logic_vector(7 downto 0);
         cols : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal direction : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal rows : std_logic_vector(7 downto 0);
   signal cols : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: snake_move PORT MAP (
          clk => clk,
          direction => direction,
          rows => rows,
          cols => cols
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      direction <= "00";
      wait for clk_period*3;
      direction <= "01";
      wait for clk_period*3;
      direction <= "10";
      wait for clk_period*3;
      direction <= "11";
      wait for clk_period*3;

      -- insert stimulus here 

      wait;
   end process;

END;
