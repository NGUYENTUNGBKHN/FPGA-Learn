----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2026 23:07:03
-- Design Name: 
-- Module Name: BUTTON_LED - Behavioral
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

entity BUTTON_LED is
    generic(
        NUMBER_BUTTONS : integer := 4
    );
    port ( 
        Led_Out : out std_logic_vector(NUMBER_BUTTONS - 1 downto 0);
        Button_in : in std_logic_vector(NUMBER_BUTTONS - 1 downto 0);
        Enable : in std_logic
        );
end BUTTON_LED;

architecture Behavioral of BUTTON_LED is

begin

    Led_Out <= Button_in when Enable = '1' else (others => '0');

end Behavioral;
