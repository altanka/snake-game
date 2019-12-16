----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:46 12/04/2019 
-- Design Name: 
-- Module Name:    button_read - Behavioral 
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

entity button_read is
    Port ( clk : in  STD_LOGIC;
           btnd : in  STD_LOGIC;
           btnl : in  STD_LOGIC;
           btnr : in  STD_LOGIC;
           btnu : in  STD_LOGIC;
           direction : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
end button_read;

architecture Behavioral of button_read is
signal direction_sub : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
begin
    process( clk )
    begin
        if clk'event and clk = '1' then
            if btnr = '1' then
                direction_sub <= "00";
            elsif btnu = '1' then
                direction_sub <= "01";
            elsif btnl = '1' then
                direction_sub <= "10";
            elsif btnd = '1' then
                direction_sub <= "11";
            end if ;
        end if ;     
    end process ;
direction <= direction_sub;

end Behavioral;

