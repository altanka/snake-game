--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:01:40 12/04/2019
-- Design Name:   
-- Module Name:   C:/Users/altan/FPGA/snake_game/btn_test.vhd
-- Project Name:  snake_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: button_read
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
 
ENTITY btn_test IS
END btn_test;
 
ARCHITECTURE behavior OF btn_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT button_read
    PORT(
         clk : IN  std_logic;
         btnd : IN  std_logic;
         btnl : IN  std_logic;
         btnr : IN  std_logic;
         btnu : IN  std_logic;
         direction : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal btnd : std_logic := '0';
   signal btnl : std_logic := '0';
   signal btnr : std_logic := '0';
   signal btnu : std_logic := '0';

 	--Outputs
   signal direction : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: button_read PORT MAP (
          clk => clk,
          btnd => btnd,
          btnl => btnl,
          btnr => btnr,
          btnu => btnu,
          direction => direction
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
      wait for 100 ns;	
		btnr <= '1';
		btnu <= '0';
		btnl <= '0';
		btnd <= '0';
      wait for clk_period*4;
		btnr <= '0';
		btnu <= '1';
		btnl <= '0';
		btnd <= '0';
      wait for clk_period*4;
		btnr <= '0';
		btnu <= '0';
		btnl <= '1';
		btnd <= '0';
      wait for clk_period*4;
		btnr <= '0';
		btnu <= '0';
		btnl <= '0';
		btnd <= '1';
      wait for clk_period*4;

   end process;

END;
