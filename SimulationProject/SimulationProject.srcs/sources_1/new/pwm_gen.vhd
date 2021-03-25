library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm_gen is
  Generic ( CLOCK_SCALER : integer := 1;
            COUNTER_MAX : integer := 1172);
  Port ( S_AXI_ACLK: in std_logic;
         PWM_a : out std_logic;
         PWM_b : out std_logic;
         PWM_c : out std_logic;
         XADC_conv_en : out std_logic);
end pwm_gen;

architecture Behavioral of pwm_gen is

    -- Signals for PWM Generator
    signal clk_div      : unsigned(7 downto 0) := "00000000";
    signal clk_scaled   : std_logic := '0';
    
    type state_counter is (COUNT_UP, COUNT_DOWN);
    signal state : state_counter;
    
    signal counter : unsigned(31 downto 0) := x"00000000";
    
   signal slv_reg0 : std_logic_vector(31 downto 0) := "00000000000000000000001100000000";
   signal slv_reg1 : std_logic_vector(31 downto 0) := "00000000000000000000000110000000";
   signal slv_reg2 : std_logic_vector(31 downto 0) := "00000000000000000000000011000000";

begin


    -- Process for slowing down counter clock
    -- clk_scaled = 100 MHz / (CLOCK_SCALER + 1)
    -- f_sw = clk_scaled / (4 * COUNTER_MAX)
    process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if (clk_div >= CLOCK_SCALER) then
                clk_div <= (others => '0');
                clk_scaled <= not clk_scaled;
            else
                clk_div <= clk_div + 1;
            end if;
        end if;
    end process;
    
    -- Process for triangular (phase-correct) counting
    process (clk_scaled)
    begin
        case state is
            when COUNT_UP =>
                if rising_edge(clk_scaled) then
                    if counter < COUNTER_MAX then
                        counter <= counter + 1;
                    else
                        counter <= counter - 1;
                        state <= COUNT_DOWN;
                    end if;
                end if;
                
            when COUNT_DOWN =>
                if rising_edge(clk_scaled) then
                    if counter > 0 then
                        counter <= counter - 1;
                    else
                        counter <= counter + 1;
                        state <= COUNT_UP;
                    end if;
                end if;
        end case;
    end process;
    
    PWM_a <= '1' when std_logic_vector(counter) < slv_reg0 else '0';
    PWM_b <= '1' when std_logic_vector(counter) < slv_reg1 else '0';
    PWM_c <= '1' when std_logic_vector(counter) < slv_reg2 else '0';
    
    XADC_conv_en <= '1' when counter = COUNTER_MAX or counter = 0 else '0';

end Behavioral;
