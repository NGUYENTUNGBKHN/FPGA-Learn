-- Wait on and Wait until

-- Entity
entity WaitOn is
end entity;

-- Architecture
architecture sim of WaitOn is
-- Signal
signal CountUp : integer := 0;
signal CountDown : integer := 10;

begin

    -- Main process
    process is
    begin
        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;
    end process;
    -- Wait on process
    process is
    begin
        wait on CountUp, CountDown;
        report "Count Up = " & integer'image(CountUp) & 
            ", Count Down = " & integer'image(CountDown);
    end process;
    -- Wait until process
    process is
    begin
        wait until CountUp = CountDown;
        report "Ping Go!!";
    end process;

end sim;


