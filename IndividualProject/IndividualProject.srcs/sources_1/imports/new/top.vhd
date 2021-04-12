library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    Port ( clk_8ns : in STD_LOGIC;
           blue_out : out STD_LOGIC_VECTOR (7 downto 0);
           red_out : out STD_LOGIC_VECTOR (7 downto 0);
           green_out : out STD_LOGIC_VECTOR (7 downto 0);
           row_out : out STD_LOGIC_VECTOR (7 downto 0);
           leds : out STD_LOGIC_VECTOR(3 downto 0);
           gyro_btn : in STD_LOGIC_VECTOR(0 downto 0);
           Vaux7_n : in STD_LOGIC;
           Vaux7_p : in STD_LOGIC;
           Vaux14_n : in STD_LOGIC;
           Vaux14_p : in STD_LOGIC;
           Vaux15_n : in STD_LOGIC;
           Vaux15_p : in STD_LOGIC);
end top;

architecture Behavioral of top is

component timer is
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component IndividualProject_wrapper is
    Port (  BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_clk : in STD_LOGIC;
            BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_en : in STD_LOGIC;
            BRAM_PORTB_0_rst : in STD_LOGIC;
            BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
            Vaux7_0_v_n : in STD_LOGIC;
            Vaux7_0_v_p : in STD_LOGIC;
            Vaux14_0_v_n : in STD_LOGIC;
            Vaux14_0_v_p : in STD_LOGIC;
            Vaux15_0_v_n : in STD_LOGIC;
            Vaux15_0_v_p : in STD_LOGIC;
            GPIO_gyro_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
            GPIO_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 ));
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
signal count_out: STD_LOGIC_VECTOR(7 downto 0);


-- Signals for state machine and memory interface input
signal row_addr: unsigned(2 downto 0) := "000";
signal row_addr_shift: unsigned(2 downto 0) := "000";

signal mem_data_in: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal mem_addr: unsigned(31 downto 0) := x"00000000";
signal bram_addr: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

signal start, done: STD_LOGIC := '0';

signal counter: unsigned(17 downto 0) := (others => '0');
signal clk_scaled: STD_LOGIC;
signal clk_BRAM: STD_LOGIC;

type state_type is (shift, get, waiting, ready);
signal state: state_type := shift;

type state_memory_type is (reset, setup, latch, ready);
signal memory_state: state_memory_type := ready;


-- Signals for the memory interface output
signal mem_data_out: STD_LOGIC_VECTOR(31 downto 0);

signal ocr_red: std_logic_vector(63 downto 0);
signal ocr_green: std_logic_vector(63 downto 0);
signal ocr_blue: std_logic_vector(63 downto 0);

signal ocr_red_sync: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_green_sync: STD_LOGIC_VECTOR(63 downto 0);
signal ocr_blue_sync: STD_LOGIC_VECTOR(63 downto 0);


-- Output PWMs for the LED board
signal values_red: STD_LOGIC_VECTOR(63 downto 0);
signal values_green: STD_LOGIC_VECTOR(63 downto 0);
signal values_blue: STD_LOGIC_VECTOR(63 downto 0);

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
    mem1: IndividualProject_wrapper port map (BRAM_PORTB_0_addr => bram_addr,
                                 BRAM_PORTB_0_clk => clk_8ns,
                                 BRAM_PORTB_0_din => (others => '0'),
                                 BRAM_PORTB_0_dout => mem_data_out,
                                 BRAM_PORTB_0_en => '1',
                                 BRAM_PORTB_0_rst => '0',
                                 BRAM_PORTB_0_we => (others => '0'),
                                 Vaux7_0_v_n => Vaux7_n,
                                 Vaux7_0_v_p => Vaux7_p,
                                 Vaux14_0_v_n => Vaux14_n,
                                 Vaux14_0_v_p => Vaux14_p,
                                 Vaux15_0_v_n => Vaux15_n,
                                 Vaux15_0_v_p => Vaux15_p,
                                 GPIO_gyro_tri_i => gyro_btn,
                                 GPIO_leds_tri_o => leds);
                                 
                                 
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
    clk_BRAM <= counter(5);


    -- Finite State Machine for controlling LED outputs
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
                        state <= get;
                    end if;
                    
                when get =>
                    if clk_scaled = '1' then
                        row_addr_shift <= row_addr_shift + 1;
                        start <= '1';
                        state <= waiting;
                    end if;
                    
                when waiting =>
                    if clk_scaled = '1' then
                        start <= '0';
                        if done = '1' then
                            state <= ready;
                        end if;
                    end if;
                
                when ready =>
                    if clk_scaled = '0' then
                        state <= shift;
                    end if;
                    
                when others =>
                    row_addr <= "000";
                    state <= shift;
            end case;
        end if;
    end process;


    -- Finite State Machine for memory interfacing
    process(clk_8ns)
    begin
        
        if rising_edge(clk_8ns) then
            case memory_state is
                when reset =>
                    mem_addr <= x"00000000";
                    done <= '0';
                    if clk_BRAM = '1' then
                        memory_state <= setup;
                    end if;
                
                when setup =>
                    bram_addr <= std_logic_vector(to_unsigned((to_integer(row_addr_shift)*32) + (to_integer(mem_addr)*4), 32));
                    if clk_BRAM = '1' then
                        memory_state <= latch;
                    end if;
                
                when latch =>
                    values_red <= values_red(55 downto 0) & mem_data_out(23 downto 16);
                    values_green <= values_green(55 downto 0) & mem_data_out(15 downto 8);
                    values_blue <= values_blue(55 downto 0) & mem_data_out(7 downto 0);

                    if clk_BRAM = '1' then
                        mem_addr <= mem_addr + 1;
                        if mem_addr < 8 then
                            memory_state <= setup;
                        else
                            memory_state <= ready;
                        end if;
                    end if;
                    
                when ready =>
                    ocr_red <= values_red;
                    ocr_green <= values_green;
                    ocr_blue <= values_blue;

                    done <= '1';
                    if start = '1' then
                        memory_state <= reset;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;