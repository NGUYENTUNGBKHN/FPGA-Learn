-- COUNTER

-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

-- Entity
entity COUNTER is
    generic(
        MAX_VAL     : integer := 2**30;
        SYNCH_FLAG  : boolean := true
    );
    port(
        Max_Count_Flag  : out std_logic;
        CLK             : in std_logic;
        Reset           : in std_logic 
    );
end COUNTER;

-- Architecture
architecture behavior of COUNTER is
-- Constant 
constant bits_depth : integer := integer(ceil(log2(real(MAX_VAL))));
-- Signal
signal count_flag : std_logic := '0';
signal counter_reg : unsigned(bits_depth - 1 downto 0) := (others => '0');

begin
    Max_Count_Flag <= count_flag;
    synch_rst: if (SYNCH_FLAG = true) generate
    begin
        counter_proc: process(CLK)
        begin
            if (rising_edge(CLK)) then
                if ((counter_reg = MAX_VAL) or Reset = '0') then
                    counter_reg <= (others => '0'); 
                else
                    counter_reg <= counter_reg + 1;
                end if;
            end if;
        end process;
    end generate synch_rst;

    asynch_rst: if (SYNCH_FLAG = false) generate
    begin
        counter_proc: process(CLK, Reset)
        begin
            
        end process;
    end generate asynch_rst;

    out_proc: process(counter_reg)
    begin
        count_flag <= '0';
        if (counter_reg = MAX_VAL) then
            count_flag <= '1';
        end if;
    end process;

end behavior;


