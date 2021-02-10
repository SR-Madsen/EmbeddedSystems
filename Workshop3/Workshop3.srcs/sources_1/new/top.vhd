library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clock_125M : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           leds : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

    component debounce is
        Port (  button: in std_logic;
                clk: in std_logic;
                btn_out: out std_logic);
    end component;
    
    component levelshift is
        Port (  button_up: in std_logic;
                button_down: in std_logic;
                freq_out: out std_logic_vector(1 downto 0));
    end component;

    component running_leds is
        Port (  clock_125M: in std_logic;
                frequency : in std_logic_vector (1 downto 0);
                leds      : out std_logic_vector (3 downto 0));
    end component;
    
    signal btn_up: std_logic;
    signal btn_down: std_logic;
    signal freqs: std_logic_vector(1 downto 0);

begin

    deb_btn_up:   debounce      port map (button => btn(0),
                                          clk => clock_125M,
                                          btn_out => btn_up);
                                   
    deb_btn_down: debounce      port map (button => btn(1),
                                          clk => clock_125M,
                                          btn_out => btn_down);
                                     
    level_shift:  levelshift    port map (button_up => btn_up,
                                          button_down => btn_down,
                                          freq_out => freqs);

    runner:       running_leds  port map (clock_125M => clock_125M,
                                          frequency => freqs,
                                          leds => leds);

end Behavioral;
