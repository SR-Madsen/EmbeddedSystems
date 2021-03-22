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
           blue_out : out STD_LOGIC_VECTOR (7 downto 0);
           red_out : out STD_LOGIC_VECTOR (7 downto 0);
           green_out : out STD_LOGIC_VECTOR (7 downto 0);
           row_out : out STD_LOGIC_VECTOR (7 downto 0));
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
    Port ( counter : in STD_LOGIC_VECTOR (7 downto 0);
           red : in STD_LOGIC_VECTOR (63 downto 0);
           green : in STD_LOGIC_VECTOR (63 downto 0);
           blue : in STD_LOGIC_VECTOR (63 downto 0);
           red_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           green_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           blue_pwm : out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- Signal for the counter's output
signal count_out: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');


-- Signals for state machine and memory interface input
signal row_addr: unsigned(2 downto 0) := "000";
signal row_addr_shift: unsigned(2 downto 0) := "000";

signal counter: unsigned(17 downto 0) := (others => '0');
signal clk_scaled: STD_LOGIC;

type state_type is (shift, ready);
signal state: state_type := shift;


-- Signals for the memory interface output
signal ocr_red: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_green: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_blue: STD_LOGIC_VECTOR(63 downto 0);

signal ocr_red_sync: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_green_sync: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_blue_sync: STD_LOGIC_VECTOR(63 downto 0);

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
    mem1: simple_memory port map (row_addr => std_logic_vector(row_addr),
                                  data_red => ocr_red,
                                  data_green => ocr_green,
                                  data_blue => ocr_blue);

    row1: rows port map (counter => count_out,
                         red => ocr_red_sync,
                         green => ocr_green_sync,
                         blue => ocr_blue_sync,
                         red_pwm => red_out,
                         green_pwm => green_out,
                         blue_pwm => blue_out);
                        
   with row_addr select row_out <=
        "11111110" when "000",
        "11111101" when "001",
        "11111011" when "010",
        "11110111" when "011",
        "11101111" when "100",
        "11011111" when "101",
        "10111111" when "110",
        "01111111" when others;
                        
                        
    -- Slow down clock
    process(clk_8ns)
    begin
        if rising_edge(clk_8ns) then
            counter <= counter + 1;
        end if;
    end process;
    
    clk_scaled <= counter(16);
    
    
    -- Finite State Machine
    process(clk_8ns)
    begin
        if rising_edge(clk_8ns) then
            case state is
                when shift =>
                    ocr_blue_sync <= ocr_blue;
                    ocr_green_sync <= ocr_green;
                    ocr_red_sync <= ocr_red;
                    row_addr <= row_addr_shift;
                    if clk_scaled = '1' then
                        state <= ready;
                    end if;
                
                when ready =>
                    if clk_scaled = '0' then
                        row_addr_shift <= row_addr_shift + 1;
                        state <= shift;
                    end if;
                    
                when others =>
                    --row_addr <= "000";
                    state <= shift;
            end case;
        end if;
    end process;

end Behavioral;
