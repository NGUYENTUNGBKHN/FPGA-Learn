-- Conuter


-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;
use IEEE.numeric_std.ALL;


entity COUNTER is
    generic(
        MAX_VAL         : integer := 2**30;
        SYNCH_Reset     : boolean := true
    );
    port(
        Max_Count       :  out std_logic;
        CLK             : in std_logic;
        Reset           : in std_logic
    );
end COUNTER;

architecture behavior of COUNTER is
-- Constant
constant bit_depth  : integer := integer(ceil(log2(real(MAX_VAL))));
signal Count_reg    : unsigned(bit_depth - 1 downto 0) := (others=>'0');

begin
    synch_rst: if SYNCH_Reset = true generate
        Count_proc: process(CLK)
        begin
            if (rising_edge(CLK)) then
                if ((Reset = '0') or (Count_reg = MAX_VAL)) then
                    Count_reg <= '0';
                else
                    Count_reg <= Count_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    asynch_rst: if SYNCH_Reset = false generate
        Count_proc: process(CLK, Reset)
        begin
            if (Reset = '0') then
                Count_reg <= (others => '0');
            elsif rising_edge(CLK) then
                if (Count_reg = MAX_VAL) then
                    Count_reg <= '0';
                else
                    Count_reg <= Count_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    output_proc: process(Count_reg)
    begin
        Max_Count <= '0';

        if (Count_reg = MAX_VAL) then
            Max_Count <= '1';
        end if;
    end process;

end behavior;
