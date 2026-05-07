-- Delay Time

entity waitForTB is
end entity;

-- architecture
architecture sim of waitForTB is
begin
    process is
    begin
        report "delay 1";
        wait for 10 ns;
    end process;
end sim;




