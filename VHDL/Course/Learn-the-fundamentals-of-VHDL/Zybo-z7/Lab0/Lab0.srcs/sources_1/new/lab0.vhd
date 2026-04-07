----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2026 11:34:22
-- Design Name: 
-- Module Name: lab0 - Behavioral
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

entity lab0 is
  generic (
     NUM_BUTTONS  : integer := 4
  );
  Port (
    Led_out    : out std_logic_vector(NUM_BUTTONS - 1 downto 0);
    Button_In  : in std_logic_vector(NUM_BUTTONS - 1 downto 0);
    Enable     : in std_logic
   );
end lab0;

architecture Behavioral of lab0 is

begin

-- Set the output ò the LED's
Led_out <= Button_In When Enable = '0' else (others => '0');

end Behavioral;
