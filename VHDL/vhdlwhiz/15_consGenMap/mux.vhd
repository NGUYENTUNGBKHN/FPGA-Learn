-- Mux

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Entity
entity MUX is
    generic(
        DataWidth : integer := 8
    );
    port(
        Sel : in unsigned(1 downto 0);
        Sig1 : in unsigned(DataWidth - 1 downto 0);
        Sig2 : in unsigned(DataWidth - 1 downto 0);
        Sig3 : in unsigned(DataWidth - 1 downto 0);
        Sig4 : in unsigned(DataWidth - 1 downto 0);
        OUTPUT1 : out unsigned(DataWidth - 1 downto 0)
    );
end entity;

-- Architecture
architecture behavior of MUX is
-- signal 
signal out_reg : unsigned(DataWidth - 1 downto 0) := (others => '0');
begin
    OUTPUT1 <= out_reg;

    my_proc : process(Sel, Sig1, Sig2, Sig3, Sig4)
    begin
        case Sel is
            when "00" =>
                out_reg <= Sig1;
            when "01" =>
                out_reg <= Sig2;
            when "10" =>
                out_reg <= Sig3;
            when "11" =>
                out_reg <= Sig4;
            when others =>
                out_reg <= (others => 'X');
        end case;
    end process;
end architecture;


