
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

signal clk_div : integer := 0;
signal temp_clock : std_logic := '1';
signal clk_scaled : std_logic := '1';

type state_type is (GET_ABS, ZERO, ONE, TWO, THREE);
signal state : state_type := GET_ABS;

signal data_temp : unsigned(DATA_LENGTH downto 0) := (others => '0');
signal index : integer := DATA_LENGTH;

signal position : unsigned(DATA_LENGTH-1 downto 0) := (others => '0');

signal S_AXI_ARESETN : std_logic := '1';


begin

	-- Scale down clock for serial communication
	-- 100 MHz / 112 = 899 kHz
    process(S_AXI_ACLK, S_AXI_ARESETN)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '1' then
                if (clk_div >= CLOCK_SCALER) then
                    clk_div <= 0;
                    temp_clock <= not temp_clock;
                else
                    clk_div <= clk_div + 1;
                end if;
                
            else
                clk_div <= 0;
                temp_clock <= not temp_clock;
            end if;
        end if;        
    end process;
    
    clk_scaled <= temp_clock;
    
    -- State Machine for both getting absolute position at startup and tracking position
    process(clk_scaled)
    variable inc_AB : std_logic_vector(1 downto 0);
    
    begin
        if S_AXI_ARESETN = '1' and index > -1 then
            SERIAL_CLOCK <= clk_scaled;
        end if;
    
        if clk_scaled'event and clk_scaled = '0' then
            if S_AXI_ARESETN = '1' then
                case state is
                    when GET_ABS =>
                        if (index = -1) then
                            SERIAL_CLOCK <= '1';
                            position <= data_temp(DATA_LENGTH-1 downto 0);
                            
                            inc_AB := INC_A & INC_B;
                            case inc_AB is
                                when "00" => state <= ZERO;
                                when "01" => state <= ONE;
                                when "10" => state <= TWO;
                                when "11" => state <= THREE;
                                when others => state <= ZERO;
                            end case;
                        else
                            data_temp(index) <= SERIAL_DATA;
                            index <= index - 1;
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
                
            else
                state <= GET_ABS;
                position <= (others => '0');
                index <= DATA_LENGTH;
                SERIAL_CLOCK <= '1';
            end if;
        end if;
    end process;
    
    slv_reg0 <= x"000000" & std_logic_vector(position);

end Behavioral;



-------------- OLD EDITION BACKUP IN CASE OF ERRORS ----------------
	-- Scale down clock for serial communication
	-- 100 MHz / 112 = 899 kHz
--    process(S_AXI_ACLK, S_AXI_ARESETN)
--    begin
--        if rising_edge(S_AXI_ACLK) then
--            if (S_AXI_ARESETN = '0') then
--                clk_div <= 0;
--                temp_clock <= '1';
--            else
--                if (clk_div >= CLOCK_SCALER) then
--                    clk_div <= 0;
--                    temp_clock <= not temp_clock;
--                else
--                    clk_div <= clk_div + 1;
--                end if;
--            end if;
--        end if;
        
--        clk_scaled <= temp_clock;
        
--    end process;
    
--    -- State Machine for both getting absolute position at startup and tracking position
--    process(S_AXI_ACLK, clk_scaled)
--    variable inc_AB : std_logic_vector(1 downto 0);
    
--    begin
--        case state is
--            when GET_ABS =>
--                SERIAL_CLOCK <= clk_scaled;
--                if clk_scaled'event and clk_scaled = '0' then
--                    if (index = -1) then
--                        SERIAL_CLOCK <= '1';
--                        position <= data_temp(DATA_LENGTH-1 downto 0);
                        
--                        inc_AB := INC_A & INC_B;
--                        case inc_AB is
--                            when "00" => state <= ZERO;
--                            when "01" => state <= ONE;
--                            when "10" => state <= TWO;
--                            when "11" => state <= THREE;
--                            when others => state <= ZERO;
--                        end case;
--                    else
--                        data_temp(index) <= SERIAL_DATA;
--                        index <= index - 1;
--                    end if;
--                end if;
                
--            when ZERO =>
--                if INC_A = '1' then
--                    position <= position - 1;
--                    state <= TWO;
--                elsif INC_B = '1' then
--                    position <= position + 1;
--                    state <= ONE;
--                end if;
            
--            when ONE =>
--                if INC_A = '1' then
--                    position <= position + 1;
--                    state <= THREE;
--                elsif INC_B = '0' then
--                    position <= position - 1;
--                    state <= ZERO;
--                end if;
            
--            when TWO =>
--                if INC_A = '0' then
--                    position <= position + 1;
--                    state <= ZERO;
--                elsif INC_B = '1' then
--                    position <= position - 1;
--                    state <= THREE;
--                end if;
                
--            when THREE =>
--                if INC_A = '0' then
--                    position <= position - 1;
--                    state <= ONE;
--                elsif INC_B = '0' then
--                    position <= position + 1;
--                    state <= TWO;
--                end if;
--        end case;
        
--        if INC_Z = '1' then
--            position <= (others => '0');
--        end if;
        
--    end process;
    
--    slv_reg0 <= x"000000" & std_logic_vector(position);