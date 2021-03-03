library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

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
           red_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           green_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           blue_pwm : out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- Signal for the counter's output
signal count_out: STD_LOGIC_VECTOR(7 downto 0);


-- Signals for state machine and memory interface input
signal row_addr: unsigned(2 downto 0) := "000";
signal row_hot: std_logic_vector(7 downto 0);

signal clk_scaled: STD_LOGIC;

type state_type is (shift, ready);
signal state: state_type := shift;


-- Signals for the memory interface output
signal ocr_red: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_green: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_blue: STD_LOGIC_VECTOR(63 downto 0);


-- Output PWMs for the LED board
signal red_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal green_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal blue_pwms: STD_LOGIC_VECTOR(7 downto 0);

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
    mem1: simple_memory port map (row_addr => std_logic_vector(row_addr),
                                  data_red => ocr_red,
                                  data_green => ocr_green,
                                  data_blue => ocr_blue);

    row1: rows port map (clk => clk_8ns,
                        counter => count_out,
                        red => ocr_red,
                        green => ocr_green,
                        blue => ocr_blue,
                        red_pwm => red_pwms,
                        green_pwm => green_pwms,
                        blue_pwm => blue_pwms);
                        
                        
    -- Slow down clock
    process(clk_8ns)
    variable prescaler: integer range 0 to 18001;
    begin
        if rising_edge(clk_8ns) then
            prescaler := prescaler + 1;
        end if;
        if prescaler >= 18000 then
            prescaler := 0;
            clk_scaled <= '1';
        else
            clk_scaled <= '0';
        end if;
    end process;
    
    
    -- Finite State Machine
    process(clk_8ns)
    begin
        blue <= blue_pwms;
        green <= green_pwms;
        red <= red_pwms;
        
        if rising_edge(clk_8ns) then
            case state is
                when shift =>
                    if clk_scaled = '1' then
                        blue <= blue_pwms;
                        green <= green_pwms;
                        red <= red_pwms;
                        row <= row_hot;
                        state <= ready;
                    end if;
                
                when ready =>
                    if clk_scaled = '1' then
                        row_addr <= row_addr + 1;
                        state <= shift;
                    end if;
                    
                when others =>
                    row_addr <= "000";
                    state <= shift;
            end case;
        end if;
    end process;

    with row_addr select
    row_hot <=      "00000001" when "000",
                    "00000010" when "001",
                    "00000100" when "010",
                    "00001000" when "011",
                    "00010000" when "100",
                    "00100000" when "101",
                    "01000000" when "110",
                    "10000000" when "111",
                    "00000000" when others;
    
    led(0) <= red_pwms(0);
    led(1) <= green_pwms(0);
    led(2) <= blue_pwms(0);
    --red <= red_pwms;
    --green <= green_pwms;
    --blue <= blue_pwms;

end Behavioral;
