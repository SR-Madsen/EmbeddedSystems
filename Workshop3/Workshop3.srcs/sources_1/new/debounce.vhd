library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
    Port ( button : in STD_LOGIC;
           clk : in STD_LOGIC;
           btn_out : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is

  signal btn_debounced : STD_LOGIC_VECTOR(1 downto 0);
  signal counter_reset : STD_LOGIC;
  
begin

    counter_reset <= btn_debounced(0) xor btn_debounced(1);
  
    process(clk)
        variable delay: integer range 0 to 12500001;
  
    begin
    
        if rising_edge(clk) then
            btn_debounced(0) <= button;
            btn_debounced(1) <= btn_debounced(0);
            
            if(counter_reset = '1') then
                delay := 0;
            elsif(delay <= 12499999) then
                delay := delay + 1;
            else
                btn_out <= btn_debounced(1);
            end if;    
        end if;
    end process;
end Behavioral;
