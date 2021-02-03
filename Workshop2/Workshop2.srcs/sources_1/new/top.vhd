----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2021 10:46:07 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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
           leds : out STD_LOGIC_VECTOR (3 downto 0);
           switches : in STD_LOGIC_VECTOR(1 downto 0));
end top;

architecture Behavioral of top is

    component running_leds is
        Port (  clock_125M: in std_logic;
                frequency : in std_logic_vector (1 downto 0);
                leds      : out std_logic_vector (3 downto 0));
     end component;
     
--     signal prescaler : std_logic_vector(1 downto 0) := "00";

     
begin

    x1: running_leds port map (clock_125M => clock_125M,
                               frequency => switches,
                               leds => leds);

end Behavioral;
