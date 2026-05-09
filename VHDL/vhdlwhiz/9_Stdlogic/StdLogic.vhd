-- Std logic

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- entity
entity Stdlogic is
end entity;

-- architecure
architecture sim of Stdlogic is
-- Signal 
signal signal1 : std_logic := '0';
signal signal2 : std_logic;
signal signal3 : std_logic;

begin
    process is
    begin
        wait for 10 ns;
        signal1 <= not signal1;
    end process;

    process is 
    begin
        signal2 <= 'Z';
        signal3 <= '0';
        wait;
    end process;

    process(signal1) is 
    begin
         if signal1 = '0' then
            signal2 <= 'Z';
            signal3 <= 'Z';
        else
            signal2 <= '1';
            signal3 <= '1';
        end if;
    end process;

end sim;

