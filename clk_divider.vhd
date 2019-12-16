----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:32 12/04/2019 
-- Design Name: 
-- Module Name:    clk_divider - Behavioral 
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

entity clk_divider is
    Port ( clk : in  STD_LOGIC;
           clk_snake : out  STD_LOGIC;
           clk_ref : out  STD_LOGIC;
           clk_btn : out  STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
    constant snake_period : integer := 1000000000; --nanoseconds
    constant btn_period : integer := 200; --nanoseconds
    constant ref_period : integer := 3300000; --nanoseconds
    signal snake : STD_LOGIC := '0';
    signal btn : STD_LOGIC := '0'; 
    signal ref : STD_LOGIC := '0'; 
    signal counter_snake : integer range 0 to 1000000000;
    signal counter_btn : integer range 0 to 1000000000;
    signal counter_ref : integer range 0 to 1000000000;
    begin
        process( clk, counter_snake, counter_btn )
        begin
            if clk'event and clk = '1' then
                counter_snake <= counter_snake + 1;
                counter_btn <= counter_btn + 1;
                counter_ref <= counter_ref + 1;
                if counter_snake = snake_period/20 - 1 then
                    counter_snake <= 0;
                    snake <= not snake;
                end if;
                if counter_btn = btn_period/20 - 1 then
                    counter_btn <= 0;
                    btn <= not btn;
                end if;
					 if counter_ref = ref_period/20 - 1 then
                    counter_ref <= 0;
                    ref <= not ref;
                end if;
            end if;
        end process ;
        clk_snake <= snake;
        clk_btn <= btn;
        clk_ref <= ref;

end Behavioral;

