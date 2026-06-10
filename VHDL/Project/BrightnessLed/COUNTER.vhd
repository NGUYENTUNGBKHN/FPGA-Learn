-- COUNTER

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Entity
entity COUNTER is
    generic(
        MAX_VAL : integer := 2**30;
        SYNC_rst : boolean := true
    );
    port (
        CLK : in std_logic;
        Reset : in std_logic;
        Max_Count : out std_logic
    );
end entity;

-- Architecture
architecture behavior of COUNTER is
-- Component

-- Consatant
    constant MAX_BITS : integer := integer(ceil(log2(real(MAX_VAL + 1))));
-- Signal
    signal counter_reg : unsigned(MAX_BITS - 1 downto 0) := (others => '0');
    signal max_cnt_reg : std_logic := '0';
begin
    Max_Count <= max_cnt_reg;
    -- Synchronous
    i_Sync : if (SYNC_rst = true) generate
        counter_proc : process(CLK) is
        begin
            if (rising_edge(CLK)) then
                if (Reset = '0' or counter_reg = MAX_VAL) then
                    counter_reg <= (others => '0');
                else
                    counter_reg <= counter_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    i_ASync : if (SYNC_rst = false) generate
        counter_proc : process(CLK, Reset) is
        begin
            if (Reset = '1') then
                counter_reg <= (others => '0');
            elsif (rising_edge(CLK)) then
                if (counter_reg = MAX_VAL) then
                    counter_reg <= (others => '0');
                else
                    counter_reg <= counter_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    out_proc : process(counter_reg) is
    begin
        if (counter_reg = MAX_VAL) then
            max_cnt_reg <= '1';
        else
            max_cnt_reg <= '0';
        end if;
    end process;

end architecture;
