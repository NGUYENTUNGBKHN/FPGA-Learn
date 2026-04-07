-- This is a commnent
-- This is another comment

library IEEE
use IEEE.STD_LOGIC

entity example is
generic(
);
port (
	My_input : in std_logic;
	My_out : out std_logic_vector (31 downto 0);
);

end example


architecture test of example
begin
-- Put your architecture code /design here
map -- this is used in component instantiations

My_input <= My_out(1);

A <= B;

end test;


