library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rows is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (63 downto 0);
           green : in STD_LOGIC_VECTOR (63 downto 0);
           blue : in STD_LOGIC_VECTOR (63 downto 0);
           red_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           green_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           blue_pwm : out STD_LOGIC_VECTOR (7 downto 0));
end rows;

architecture Behavioral of rows is

    component color_channel is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (7 downto 0);
           green : in STD_LOGIC_VECTOR (7 downto 0);
           blue : in STD_LOGIC_VECTOR (7 downto 0);
           red_pwm : out STD_LOGIC;
           green_pwm : out STD_LOGIC;
           blue_pwm : out STD_LOGIC);
    end component;

begin
    multi_colors:
    for I in 0 to 7 generate
        COLORS: color_channel port map ( counter => counter,
                                         red => red(I*8+7 downto I*8),
                                         green => green(I*8+7 downto I*8),
                                         blue => blue(I*8+7 downto I*8),
                                         red_pwm => red_pwm(I),
                                         green_pwm => green_pwm(I),
                                         blue_pwm => blue_pwm(I));
    end generate;
end Behavioral;
