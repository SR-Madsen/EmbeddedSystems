library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rows is
    Port ( clk : in STD_LOGIC;
           counter : in STD_LOGIC_VECTOR (7 downto 0);
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

    signal red_pwm_array: std_logic_vector(7 downto 0);
    signal green_pwm_array: std_logic_vector(7 downto 0);
    signal blue_pwm_array: std_logic_vector(7 downto 0);

begin
    multi_colors:
    for I in 0 to 7 generate
        COLORS: color_channel port map ( counter => counter,
                                         red => red(I*8+7 downto I*8),
                                         green => green(I*8+7 downto I*8),
                                         blue => blue(I*8+7 downto I*8),
                                         red_pwm => red_pwm_array(I),
                                         green_pwm => green_pwm_array(I),
                                         blue_pwm => blue_pwm_array(I));
    end generate;
end Behavioral;
