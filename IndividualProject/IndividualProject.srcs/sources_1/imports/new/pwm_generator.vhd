library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_generator is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           ocr : in STD_LOGIC_VECTOR (7 downto 0);
           pwm : out STD_LOGIC);
end pwm_generator;

architecture Behavioral of pwm_generator is

begin

    pwm <= '1' when ocr > counter else '0';

end Behavioral;
