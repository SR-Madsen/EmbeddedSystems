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
           led : out STD_LOGIC_VECTOR (3 downto 0);
           blue : out STD_LOGIC_VECTOR (7 downto 0);
           red : out STD_LOGIC_VECTOR (7 downto 0);
           green : out STD_LOGIC_VECTOR (7 downto 0);
           row : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

component timer is
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component simple_memory is
    Port ( row_addr       : in STD_LOGIC_VECTOR (2 downto 0);
           data_red       : out STD_LOGIC_VECTOR (63 downto 0);
           data_green     : out STD_LOGIC_VECTOR (63 downto 0);
           data_blue      : out STD_LOGIC_VECTOR (63 downto 0));
end component;

component rows is
    Port ( clk : in STD_LOGIC;
           counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (63 downto 0);
           green : in STD_LOGIC_VECTOR (63 downto 0);
           blue : in STD_LOGIC_VECTOR (63 downto 0);
           row_sel : out STD_LOGIC_VECTOR (2 downto 0);
           row_hot : out STD_LOGIC_VECTOR (7 downto 0);
           red_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           green_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           blue_pwm : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal count_out: STD_LOGIC_VECTOR(7 downto 0);

signal row_sel: STD_LOGIC_VECTOR(2 downto 0);

signal ocr_red: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_green: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_blue: STD_LOGIC_VECTOR(63 downto 0);

signal red_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal green_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal blue_pwms: STD_LOGIC_VECTOR(7 downto 0);

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
    mem1: simple_memory port map (row_addr => row_sel,
                                  data_red => ocr_red,
                                  data_green => ocr_green,
                                  data_blue => ocr_blue);

    row1: rows port map (clk => clk_8ns,
                        counter => count_out,
                        red => ocr_red,
                        green => ocr_green,
                        blue => ocr_blue,
                        row_sel => row_sel,
                        row_hot => row,
                        red_pwm => red_pwms,
                        green_pwm => green_pwms,
                        blue_pwm => blue_pwms);
    
    led(0) <= red_pwms(0);
    led(1) <= green_pwms(0);
    led(2) <= blue_pwms(0);
    --red <= red_pwms;
    --green <= green_pwms;
    --blue <= blue_pwms;

end Behavioral;
