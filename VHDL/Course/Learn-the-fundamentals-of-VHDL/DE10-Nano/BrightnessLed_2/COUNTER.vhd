-- COUNTER

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Entity
entity COUNTER is
    generic (
        MAX_VAL     : integer := 2**30;
        SYNC_rst    : boolean := true
    );
    port (
        Max_cnt : out std_logic;
        CLK     : in std_logic;
        Reset   : in std_logic
    );
end entity;

-- Architecture
architecture behavior of COUNTER is
-- Constant
    constant MAX_BITS : integer := integer(ceil(log2(real(MAX_VAL))));
-- Signal
    signal max_cnt_reg : std_logic := '0';
    signal count_reg : unsigned(MAX_BITS - 1 downto 0) := (others => '0');
    
begin
    Max_cnt <= max_cnt_reg;
    i_Sync : if (SYNC_rst = true) generate
    begin
        count_proc : process(CLK) 
        begin
            if (rising_edge(CLK)) then
                if ((Reset = '0') or (count_reg = MAX_VAL)) then
                    count_reg <= (others => '0');
                else
                    count_reg <= count_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    i_ASync : if (SYNC_rst = false) generate
    begin
        count_proc : process(CLK, Reset)
        begin
            if (Reset = '0') then
                count_reg <= (others => '0');
            elsif (rising_edge(CLK)) then
                if (count_reg = MAX_VAL) then
                    count_reg <= (others => '0');
                else
                    count_reg <= count_reg + 1;
                end if;
            end if;
        end process;
    end generate;

    out_proc : process(count_reg)
    begin
        if (count_reg = MAX_VAL) then
            max_cnt_reg <= '1';
        else
            max_cnt_reg <= '0';
        end if;
    end process;
    
end architecture;
