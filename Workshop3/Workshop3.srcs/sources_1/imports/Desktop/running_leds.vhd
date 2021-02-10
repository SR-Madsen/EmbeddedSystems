library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;


entity running_leds is
    Port ( 
        clock_125M      : in std_logic;
        frequency       : in std_logic_vector (1 downto 0);
        leds            : out std_logic_vector (3 downto 0));
end running_leds;

architecture Behavioral of running_leds is

    signal  prescaler   : unsigned(31 downto 0) := x"00000000";
    signal  shift_led   : std_logic_vector(3 downto 0) := "0000";
    signal  clock_flash : std_logic;
    signal  clock_run   : std_logic;
    
begin 
    
    leds <= shift_led(3 downto 0);
    
    with frequency select 
        clock_run <=    prescaler(27) when "00",
                        prescaler(26) when "01", 
                        prescaler(25) when "10", 
                        prescaler(24) when "11";
 
    
    with frequency select    
        clock_flash <=  prescaler(24) when "00",
                        prescaler(23) when "01", 
                        prescaler(22) when "10", 
                        prescaler(21) when "11";
                    
prescaling:
process (clock_125M)
begin
   if rising_edge(clock_125M) then
        prescaler <= prescaler + 1;
   end if;
end process;

flashing:
process (clock_flash)
begin
    if rising_edge(clock_flash) then  
          
        -- 4-bit shift register
        shift_led(2 downto 0) <= shift_led(3 downto 1);
        
        -- insert ones or zeros into shift register based on slower clock
        shift_led(3) <= clock_run;

    end if;
end process;


end Behavioral;

