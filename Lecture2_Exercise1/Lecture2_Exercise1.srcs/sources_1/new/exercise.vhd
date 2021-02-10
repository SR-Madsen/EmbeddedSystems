library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exercise is
    Port ( switches : in STD_LOGIC_VECTOR (1 downto 0);
           leds : out STD_LOGIC_VECTOR (3 downto 0));
end exercise;

architecture Behavioral of exercise is

begin
    leds <= "0001" when switches = "00" else
            "0010" when switches = "01" else
            "0100" when switches = "10" else
            "1000" when switches = "11";
end Behavioral;
