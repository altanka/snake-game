----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:39 12/04/2019 
-- Design Name: 
-- Module Name:    snake_game - Behavioral 
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

entity snake_game is
    Port ( clk100mhz : in  STD_LOGIC;
           btnd : in  STD_LOGIC;
           btnl : in  STD_LOGIC;
           btnr : in  STD_LOGIC;
           btnu : in  STD_LOGIC;
           ja : out  STD_LOGIC_VECTOR (10 downto 1);
           jb : out  STD_LOGIC_VECTOR (10 downto 1));
end snake_game;

architecture Behavioral of snake_game is

    component clk_divider is
        Port ( clk : in  STD_LOGIC;
            clk_snake : out  STD_LOGIC;
            clk_ref : out  STD_LOGIC;
            clk_btn : out  STD_LOGIC);
    end component;

    component button_read is
        Port ( clk : in  STD_LOGIC;
            btnd : in  STD_LOGIC;
            btnl : in  STD_LOGIC;
            btnr : in  STD_LOGIC;
            btnu : in  STD_LOGIC;
            direction : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
    end component;

    component snake_move is
        Port ( clk : in  STD_LOGIC;
				clk_ref : in STD_LOGIC;
            direction : in  STD_LOGIC_VECTOR (1 downto 0);
            rows : out  STD_LOGIC_VECTOR (7 downto 0);
            cols : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal clk_snake_sub : std_logic;
    signal clk_btn_sub : std_logic;
    signal clk_ref_sub : std_logic;
    signal direction_sub : std_logic_vector (1 downto 0);
	signal row_sub : std_logic_vector (10 downto 1);
	signal col_sub : std_logic_vector (10 downto 1);
begin
    ------------ Clock Divider for clk_snake: Snake Movement, clk_btn: Read button, clk_ref: Refresh clock for LED Matrix --------------
    clk_divider_comp : clk_divider port map (clk => clk100mhz, clk_snake => clk_snake_sub, clk_btn => clk_btn_sub, clk_ref => clk_ref_sub);
    ----------------------------------------- Button Read for changing direction of the snake ------------------------------------------
    button_read_comp : button_read port map (clk => clk_btn_sub, btnd => btnd, btnl => btnl, btnr => btnr, btnu => btnu, direction => direction_sub);
    --------------------------------------------- Snake algorithm and write to LED Matrix ----------------------------------------------
    snake_move_comp : snake_move port map (clk => clk_snake_sub, clk_ref => clk_ref_sub, direction => direction_sub, rows(3 downto 0) => ja(4 downto 1), rows(7 downto 4) => ja(10 downto 7), cols(3 downto 0) => jb(4 downto 1), cols(7 downto 4) => jb(10 downto 7));

end Behavioral;

