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
           row_sel : out STD_LOGIC_VECTOR (2 downto 0);
           row_hot : out STD_LOGIC_VECTOR (7 downto 0);
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
    
    signal clk_scaled: STD_LOGIC;
    
    type state_type is (shift, ready);
    signal state: state_type := shift;
    
    signal row_addr: unsigned(2 downto 0) := "000";

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

    -- Slow down clock
    process(clk)
    variable prescaler: integer range 0 to 18001;
    
    begin
        if rising_edge(clk) then
            prescaler := prescaler + 1;
        end if;
        if prescaler >= 18000 then
            prescaler := 0;
            clk_scaled <= not clk_scaled;
        end if;
    end process;
    
    -- FSM with slow clock
    process(clk_scaled)
    
    begin
        blue_pwm <= blue_pwm_array;
        green_pwm <= green_pwm_array;
        red_pwm <= red_pwm_array;
        row_sel <= std_logic_vector(row_addr);
        
        if rising_edge(clk_scaled) then
            case state is
                when shift =>
                    blue_pwm <= blue_pwm_array;
                    green_pwm <= green_pwm_array;
                    red_pwm <= red_pwm_array;
                    row_sel <= std_logic_vector(row_addr);
                    state <= ready;
                
                when ready =>
                    row_addr <= row_addr + 1;
                    row_sel <= std_logic_vector(row_addr);
                    state <= shift;
                    
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

end Behavioral;
