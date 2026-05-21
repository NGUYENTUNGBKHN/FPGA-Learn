
-- Port Map

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Entity
entity portMap is
end entity;

-- Architecture
architecture sim of portMap is
-- Component
component MUX is
    port(
        Sel : in unsigned(1 downto 0);
        Sig1 : in unsigned(7 downto 0);
        Sig2 : in unsigned(7 downto 0);
        Sig3 : in unsigned(7 downto 0);
        Sig4 : in unsigned(7 downto 0);
        OUTPUT1 : out unsigned(7 downto 0)
    );
end component;

-- Signal
signal Sig1 : unsigned(7 downto 0) := x"AA";
signal Sig2 : unsigned(7 downto 0) := x"BB";
signal Sig3 : unsigned(7 downto 0) := x"CC";
signal Sig4 : unsigned(7 downto 0) := x"DD";

signal Sel : unsigned(1 downto 0) := (others => '0');

signal Output1 : unsigned(7 downto 0);

begin
    MUX_test : MUX
        port map(
            Sel => Sel,
            Sig1 =>Sig1,
            Sig2 => Sig2,
            Sig3 => Sig3,
            Sig4 => Sig4,
            Output1 => OUTPUT1
        );

    process is
    begin
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= "UU";
        wait;
    end process;

end architecture;


