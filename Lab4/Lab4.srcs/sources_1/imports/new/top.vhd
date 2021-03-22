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

component Lab4_wrapper is
    Port (  BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_clk : in STD_LOGIC;
            BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
            BRAM_PORTB_0_en : in STD_LOGIC;
            BRAM_PORTB_0_rst : in STD_LOGIC;
            BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
            DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
            DDR_cas_n : inout STD_LOGIC;
            DDR_ck_n : inout STD_LOGIC;
            DDR_ck_p : inout STD_LOGIC;
            DDR_cke : inout STD_LOGIC;
            DDR_cs_n : inout STD_LOGIC;
            DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
            DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_odt : inout STD_LOGIC;
            DDR_ras_n : inout STD_LOGIC;
            DDR_reset_n : inout STD_LOGIC;
            DDR_we_n : inout STD_LOGIC;
            FIXED_IO_ddr_vrn : inout STD_LOGIC;
            FIXED_IO_ddr_vrp : inout STD_LOGIC;
            FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
            FIXED_IO_ps_clk : inout STD_LOGIC;
            FIXED_IO_ps_porb : inout STD_LOGIC;
            FIXED_IO_ps_srstb : inout STD_LOGIC);
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
signal row_addr_shift: unsigned(2 downto 0) := "000";

signal mem_data_in: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal mem_write_enable: STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal mem_addr: unsigned(31 downto 0) := x"00000000";
signal bram_addr: STD_LOGIC_VECTOR(31 downto 0);

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
signal red_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal green_pwms: STD_LOGIC_VECTOR(7 downto 0);
signal blue_pwms: STD_LOGIC_VECTOR(7 downto 0);

signal values_red: STD_LOGIC_VECTOR(63 downto 0);
signal values_green: STD_LOGIC_VECTOR(63 downto 0);
signal values_blue: STD_LOGIC_VECTOR(63 downto 0);

-- Signals for constants used for unused DDR and I/O
signal DDRaddr : STD_LOGIC_VECTOR( 14 downto 0 ) := "000000000000000";
signal DDRba : STD_LOGIC_VECTOR ( 2 downto 0 ) := "000";
signal DDRcas_n : STD_LOGIC := '0';
signal DDRck_n : STD_LOGIC := '0';
signal DDRck_p : STD_LOGIC := '0';
signal DDRcke : STD_LOGIC := '0';
signal DDRcs_n : STD_LOGIC := '1';
signal DDRdm : STD_LOGIC_VECTOR ( 3 downto 0 ) := "0000";
signal DDRdq : STD_LOGIC_VECTOR ( 31 downto 0 ) := x"00000000";
signal DDRdqs_n : STD_LOGIC_VECTOR ( 3 downto 0 ) := "0000";
signal DDRdqs_p : STD_LOGIC_VECTOR ( 3 downto 0 ) := "0000";
signal DDRodt : STD_LOGIC := '0';
signal DDRras_n : STD_LOGIC := '0';
signal DDRreset_n : STD_LOGIC := '1';
signal DDRwe_n : STD_LOGIC := '0';
signal FIXEDIO_ddr_vrn : STD_LOGIC := '0';
signal FIXEDIO_ddr_vrp : STD_LOGIC := '0';
signal FIXEDIO_mio : STD_LOGIC_VECTOR ( 53 downto 0 ) := (others => '0');
signal FIXEDIO_ps_clk : STD_LOGIC := '0';
signal FIXEDIO_ps_porb : STD_LOGIC := '0';
signal FIXEDIO_ps_srstb : STD_LOGIC := '0';

begin

    timer1: timer port map (clk => clk_8ns,
                            count => count_out);
                            
    mem1: Lab4_wrapper port map (BRAM_PORTB_0_addr => bram_addr,
                                 BRAM_PORTB_0_clk => clk_8ns,
                                 BRAM_PORTB_0_din => mem_data_in,
                                 BRAM_PORTB_0_dout => mem_data_out,
                                 BRAM_PORTB_0_en => '1',
                                 BRAM_PORTB_0_rst => '1',
                                 BRAM_PORTB_0_we => mem_write_enable,
                                 DDR_addr => DDRaddr,
                                 DDR_ba => DDRba,
                                 DDR_cas_n => DDRcas_n,
                                 DDR_ck_n => DDRck_n,
                                 DDR_ck_p => DDRck_p,
                                 DDR_cke => DDRcke,
                                 DDR_cs_n => DDRcs_n,
                                 DDR_dm => DDRdm,
                                 DDR_dq => DDRdq,
                                 DDR_dqs_n => DDRdqs_n,
                                 DDR_dqs_p => DDRdqs_p,
                                 DDR_odt => DDRodt,
                                 DDR_ras_n => DDRras_n,
                                 DDR_reset_n => DDRreset_n,
                                 DDR_we_n => DDRwe_n,
                                 FIXED_IO_ddr_vrn => FIXEDIO_ddr_vrn,
                                 FIXED_IO_ddr_vrp => FIXEDIO_ddr_vrp,
                                 FIXED_IO_mio => FIXEDIO_mio,
                                 FIXED_IO_ps_clk => FIXEDIO_ps_clk,
                                 FIXED_IO_ps_porb => FIXEDIO_ps_porb,
                                 FIXED_IO_ps_srstb => FIXEDIO_ps_srstb);

    row1: rows port map (clk => clk_8ns,
                         counter => count_out,
                         red => values_red,
                         green => values_green,
                         blue => values_blue,
                         red_pwm => red_pwms,
                         green_pwm => green_pwms,
                         blue_pwm => blue_pwms);


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
    -- The clock used within the state machine may need to be slowed down!
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