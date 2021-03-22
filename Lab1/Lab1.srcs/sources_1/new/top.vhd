library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk_8ns : in STD_LOGIC;
           blue : out STD_LOGIC_VECTOR (7 downto 0);
           red : out STD_LOGIC_VECTOR (7 downto 0);
           green : out STD_LOGIC_VECTOR (7 downto 0);
           row_out : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

component timer is
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

--component pwm_generator is
--    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
--           ocr : in STD_LOGIC_VECTOR (7 downto 0);
--           pwm : out STD_LOGIC);
--end component;

--component color_channel is
--    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
--           red : in STD_LOGIC_VECTOR (7 downto 0);
--           green : in STD_LOGIC_VECTOR (7 downto 0);
--           blue : in STD_LOGIC_VECTOR (7 downto 0);
--           red_pwm : out STD_LOGIC;
--           green_pwm : out STD_LOGIC;
--           blue_pwm : out STD_LOGIC);
--end component;

component row is
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (63 downto 0);
           green : in STD_LOGIC_VECTOR (63 downto 0);
           blue : in STD_LOGIC_VECTOR (63 downto 0);
           red_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           green_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           blue_pwm : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal count_out: STD_LOGIC_VECTOR(7 downto 0);
signal ocr_red: STD_LOGIC_VECTOR(63 downto 0) := "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "11111111";
signal ocr_green: STD_LOGIC_VECTOR(63 downto 0) := "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "01000000";
signal ocr_blue: STD_LOGIC_VECTOR(63 downto 0) := "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000000" & "00000001";

--signal red_pwms: STD_LOGIC_VECTOR(7 downto 0);
--signal green_pwms: STD_LOGIC_VECTOR(7 downto 0);
--signal blue_pwms: STD_LOGIC_VECTOR(7 downto 0);

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
--    pwm_generator1: pwm_generator port map (counter => count_out,
--                                            ocr => ocr_static,
--                                            pwm => led(0));

--    color_channel1: color_channel port map (counter => count_out,
--                                            red => ocr_red,
--                                            green => ocr_green,
--                                            blue => ocr_blue,
--                                            red_pwm => led(0),
--                                            green_pwm => led(1),
--                                            blue_pwm => led(2));

    row1: row port map (counter => count_out,
                        red => ocr_red,
                        green => ocr_green,
                        blue => ocr_blue,
                        red_pwm => red,
                        green_pwm => green,
                        blue_pwm => blue);
                        
row_out <= "11111110";

end Behavioral;
