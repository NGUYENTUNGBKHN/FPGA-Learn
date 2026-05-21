-- Constant and Generic Map in VHDL

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity ConsGenMap is
end entity;

-- Architecture 
architecture sim of ConsGenMap is
    -- Component
    component MUX is
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
    end component;
    -- Constant
    constant DataWidth : integer := 8;
    -- signal 
    signal Sig1 : unsigned(DataWidth-1 downto 0) := x"AA";
    signal Sig2 : unsigned(DataWidth-1 downto 0) := x"BB";
    signal Sig3 : unsigned(DataWidth-1 downto 0) := x"CC";
    signal Sig4 : unsigned(DataWidth-1 downto 0) := x"DD";
  
    signal Sel : unsigned(1 downto 0) := (others => '0');
  
    signal Output1 : unsigned(DataWidth-1 downto 0);

begin 
    MUX_proc : MUX
        generic map(DataWidth => DataWidth)
        port map(
            Sel => Sel,
            Sig1 => Sig1,
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
    end process;

end architecture;


