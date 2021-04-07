library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer is
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end timer;

architecture Behavioral of timer is

signal counter : UNSIGNED(12 downto 0) := (others => '0');

begin
    -- Clock in = 125 MHz (8 ns)
    -- Timer frequency must be 7.5 kHz and counter 8 bit.
    
    count <= STD_LOGIC_VECTOR(counter(12 downto 5));
    
    -- Take 125 MHz and slow it down
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;

end Behavioral;
