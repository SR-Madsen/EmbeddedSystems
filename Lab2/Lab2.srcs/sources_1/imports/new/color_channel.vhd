library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_channel is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (7 downto 0);
           green : in STD_LOGIC_VECTOR (7 downto 0);
           blue : in STD_LOGIC_VECTOR (7 downto 0);
           red_pwm : out STD_LOGIC;
           green_pwm : out STD_LOGIC;
           blue_pwm : out STD_LOGIC);
end color_channel;

architecture Behavioral of color_channel is

    component pwm_generator is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           ocr : in STD_LOGIC_VECTOR (7 downto 0);
           pwm : out STD_LOGIC);
    end component;

begin
    pwm_red: pwm_generator port map (counter => counter,
                                     ocr => red,
                                     pwm => red_pwm);

    pwm_green: pwm_generator port map (counter => counter,
                                       ocr => green,
                                       pwm => green_pwm);
                                       
    pwm_blue: pwm_generator port map (counter => counter,
                                      ocr => blue,
                                      pwm => blue_pwm);

end Behavioral;
