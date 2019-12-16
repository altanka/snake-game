----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:11:01 12/04/2019 
-- Design Name: 
-- Module Name:    snake_move - Behavioral 
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

entity snake_move is
    Port ( clk : in  STD_LOGIC;
           clk_ref : in STD_LOGIC;
           direction : in  STD_LOGIC_VECTOR (1 downto 0);
           rows : out  STD_LOGIC_VECTOR (7 downto 0);
           cols : out  STD_LOGIC_VECTOR (7 downto 0));
end snake_move;

architecture Behavioral of snake_move is

    type coords is array (0 to 2) of integer;
    signal snake_x : coords := (3, 2, 1);
    signal snake_y : coords := (2, 2, 2);
	signal count : integer range 0 to 4;
    signal rows_sub : STD_LOGIC_VECTOR (7 downto 0);
    signal cols_sub : STD_LOGIC_VECTOR (7 downto 0);

    begin
        -------- Algorithm of snake game --------
        process(clk, direction, snake_x, snake_y)
        begin
            if clk'event and clk = '1' then
                -- Loop for tail to follow head --
                for i in 1 to 2 loop
                    snake_x(i) <= snake_x(i - 1);
                    snake_y(i) <= snake_y(i - 1);
                end loop ;
                -- Change head position respect to direction --
                if direction = "00" then
                    snake_x(0) <= snake_x(0) + 1;
                elsif direction = "01" then
                    snake_y(0) <= snake_y(0) - 1;
                elsif direction = "10" then
                    snake_x(0) <= snake_x(0) - 1;
                elsif direction = "11" then
                    snake_y(0) <= snake_y(0) + 1;
                end if ;
            end if ;
        end process ;
        -- Activate one col and one row in one clock to prevent activate wrong leds --
		process(clk_ref, snake_x, snake_y, count, rows_sub, cols_sub)
        begin
            if clk_ref'event and clk_ref = '1' then
                rows_sub <= "00000000";
                cols_sub <= "11111111";
            
                cols_sub(snake_x(count)) <= '0';
                rows_sub(snake_y(count)) <= '1';
                
                count <= count + 1;
                if count = 3 then
                    count <= 0;
                end if;
                rows <= rows_sub;
                cols <= cols_sub;
            end if;
        end process;

end Behavioral;

