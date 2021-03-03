library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch is
    Port ( clock_125M : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           leds : out STD_LOGIC_VECTOR (3 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

signal clk_1Hz: STD_LOGIC;

type state_type is (stopped, running);
signal state: state_type := stopped;

signal sync_state, sync_reset: std_logic;

begin

    process(clock_125M)
    variable scaler: integer range 0 to 125000001;
    
    begin
        if rising_edge(clock_125M) then
            scaler := scaler + 1;
            if scaler >= 125000000 then
                scaler := 0;
                clk_1Hz <= '1';
            else
                clk_1Hz <= '0';
            end if;
        end if;
    end process;
    
    process(state, btn(0), btn(1), clock_125M)
    variable counter: unsigned(3 downto 0) := "0000";
    
    begin
        leds <= std_logic_vector(counter);
        
        sync_state <= '0';
        sync_reset <= '0';
        
        if rising_edge(clock_125M) then
            case state is
                when stopped =>
                    leds <= std_logic_vector(counter);
                    if (btn(0) = '1') then
                        state <= running;
                    end if;
                    if (btn(1) = '1') then
                        counter := "0000";
                    end if;
                    
                when running =>
                    leds <= std_logic_vector(counter);
                    if clk_1Hz = '1' then
                        counter := counter + 1;
                    end if;
                    if (btn(0) = '1') then
                        state <= stopped;
                    end if;
                    if (btn(1) = '1') then
                        counter := "0000";
                    end if;
                    
                when others =>
                    leds <= std_logic_vector(counter);
                    state <= stopped;
            end case;
        end if;
        
    end process;

end Behavioral;
