library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end timer;

architecture Behavioral of timer is

signal counter : UNSIGNED(7 downto 0) := (others => '0');
signal slow_clk : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Clock in = 125 MHz (8 ns)
    -- Timer frequency must be 7.5 kHz and counter 8 bit.
    
    count <= STD_LOGIC_VECTOR(counter);
    
    -- Take 125 MHz and slow it down
    process(clk)
    begin
        if rising_edge(clk) then
            slow_clk <= slow_clk + 1;
        end if;
    end process;
    
    -- Use slow clock for counting on timer
    process(slow_clk)
    begin
        if rising_edge(slow_clk(5)) then
            counter <= counter + 1;
        end if;
    end process;

end Behavioral;
