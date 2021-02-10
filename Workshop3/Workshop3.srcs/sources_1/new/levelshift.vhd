library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity levelshift is
    Port ( button_up : in STD_LOGIC;
           button_down : in STD_LOGIC;
           freq_out : out STD_LOGIC_VECTOR (1 downto 0));
end levelshift;

architecture Behavioral of levelshift is

signal frequency: std_logic_vector(1 downto 0);
signal prev_up: std_logic;
signal prev_down: std_logic;

begin

    process (button_up, button_down)
            
    begin
    
        freq_out <= frequency;
        
        if button_up = '1' and prev_up = '0' then
            case (frequency) is
                when "00" => frequency <= "01";
                when "01" => frequency <= "10";
                when "10" => frequency <= "11";
                when others => frequency <= "00";
            end case;
        elsif button_up = '0' then
            prev_up <= '0';
        else 
            prev_up <= '1';
        end if;
        
        if button_down = '1' and prev_down = '0' then
            case (frequency) is
                when "00" => frequency <= "11";
                when "01" => frequency <= "00";
                when "10" => frequency <= "01";
                when others => frequency <= "10";
            end case;
        elsif button_down = '0' then
            prev_down <= '0';
        else
            prev_down <= '1';
        end if;
    
    end process;

end Behavioral;
