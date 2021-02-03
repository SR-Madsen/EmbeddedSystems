library ieee;
use ieee.std_logic_1164.all;

entity workshop1 is
    Port ( 
        switches    : in std_logic_vector (3 downto 0);
        leds        : out std_logic_vector (3 downto 0));
end workshop1;

architecture Behavioral of workshop1 is

begin

    leds <= switches;

end Behavioral;
