
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity encoder_driver is
    Generic (DATA_LENGTH : integer := 8;
             CLOCK_SCALER : integer := 112);
    Port    (SERIAL_DATA : in std_logic;
             SERIAL_CLOCK : out std_logic;
             INC_A : in std_logic;
             INC_B : in std_logic;
             INC_Z : in std_logic;
             S_AXI_ACLK : in std_logic;
             slv_reg0 : out std_logic_vector(31 downto 0));
end encoder_driver;


architecture Behavioral of encoder_driver is

signal clkdiv : integer := 0;
signal clk_scaled : std_logic := '1';

type state_type is (GET_ABS, ZERO, ONE, TWO, THREE);
signal state : state_type := GET_ABS;

signal data_temp : unsigned(DATA_LENGTH downto 0) := (others => '0');
signal index : integer := DATA_LENGTH;

signal position : unsigned(DATA_LENGTH-1 downto 0) := (others => '0');


begin


-- 100 MHz / 112 = 899 kHz
    process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if (clkdiv >= CLOCK_SCALER) then
                clkdiv <= 0;
                clk_scaled <= not clk_scaled;
            else
                clkdiv <= clkdiv + 1;
            end if;
        end if;
    end process;
    
    SERIAL_CLOCK <= clk_scaled;
    
    -- State Machine for both getting absolute position at startup and tracking position
    process(S_AXI_ACLK, clk_scaled)
    begin
        case state is
            when GET_ABS =>
                if clk_scaled'event and clk_scaled = '0' then
                    if (index = -1) then
                        position <= data_temp(DATA_LENGTH-1 downto 0);
                        
                        if INC_A = '0' and INC_B = '0' then
                            state <= ZERO;
                        elsif INC_A = '0' and INC_B = '1' then
                            state <= ONE;
                        elsif INC_A = '1' and INC_B = '0' then
                            state <= TWO;
                        elsif INC_A = '1' and INC_B = '1' then
                            state <= THREE;
                        end if;
                    else
                        data_temp(index) <= SERIAL_DATA;
                        index <= index - 1;
                    end if;
                end if;
                
            when ZERO =>
                if INC_A = '1' then
                    position <= position - 1;
                    state <= TWO;
                elsif INC_B = '1' then
                    position <= position + 1;
                    state <= ONE;
                end if;
            
            when ONE =>
                if INC_A = '1' then
                    position <= position + 1;
                    state <= THREE;
                elsif INC_B = '0' then
                    position <= position - 1;
                    state <= ZERO;
                end if;
            
            when TWO =>
                if INC_A = '0' then
                    position <= position + 1;
                    state <= ZERO;
                elsif INC_B = '1' then
                    position <= position - 1;
                    state <= THREE;
                end if;
                
            when THREE =>
                if INC_A = '0' then
                    position <= position - 1;
                    state <= ONE;
                elsif INC_B = '0' then
                    position <= position + 1;
                    state <= TWO;
                end if;
        end case;
        
        if INC_Z = '1' then
            position <= (others => '0');
        end if;
        
    end process;
    
    slv_reg0 <= x"000000" & std_logic_vector(position);


end Behavioral;
