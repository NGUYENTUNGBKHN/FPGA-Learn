-- This is a commnent
-- This is another comment

library IEEE;
use IEEE.std_logic_1164.all;

entity example is
generic(
	N : integer := 4
);
port (
	My_out : in std_logic;
	My_input : out std_logic_vector (31 downto 0)
);
end example;


architecture test of example is
begin
-- Put your architecture code /design here
-- map -- this is used in component instantiations

My_input <= My_out(1);

end test;


