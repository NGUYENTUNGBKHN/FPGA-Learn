-- MUX

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity MUX is
    port(
        Sel : in unsigned(1 downto 0);
        Sig1 : in unsigned(7 downto 0);
        Sig2 : in unsigned(7 downto 0);
        Sig3 : in unsigned(7 downto 0);
        Sig4 : in unsigned(7 downto 0);
        OUTPUT1 : out unsigned(7 downto 0)
    );
end entity;

-- Architecture
architecture behavior of MUX is
-- signal 
signal output_reg : unsigned(7 downto 0);


begin
    OUTPUT1 <= output_reg;

    main_proc : process(Sel, Sig1, Sig2, Sig3, Sig4)
    begin
        case Sel is
            when "00" =>
                output_reg <= Sig1;
            when "01" =>
                output_reg <= Sig2;
            when "10" =>
                output_reg <= Sig3;
            when "11" => 
                output_reg <= Sig4;
            when others =>
                output_reg <= (others => 'X');
        end case;
    end process;
end architecture;

