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
    
    --signal ocr_array: std_logic_vector(23 downto 0) := red & green & blue;
    signal pwm_array: std_logic_vector(2 downto 0);
    
    type t_ocr_array is array (0 to 2) of std_logic_vector(7 downto 0);
    signal ocr_array : t_ocr_array := (red, green, blue);

begin
    multi_pwm:
    for I in 0 to 2 generate
        PWMS: pwm_generator port map ( counter => counter,
                                       ocr => ocr_array(I),
                                       --ocr => ocr_array(I*8+7 downto I*8),
                                       pwm => pwm_array(I));
    end generate;
    
    blue_pwm <= pwm_array(2);
    green_pwm <= pwm_array(1);
    red_pwm <= pwm_array(0);

end Behavioral;
