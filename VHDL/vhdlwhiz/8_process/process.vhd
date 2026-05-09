-- Process

-- Entity
entity ProcessSensitivity is
end entity;

-- architecture
architecture sim of ProcessSensitivity is
--Signal 
signal CountUp : integer := 0;
signal CountDown : integer := 10;
begin
    process is 
    begin
        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;
    end process;

    process is
    begin
        wait until CountDown = CountUp;
        report "Ping Go process 1!!";
    end process;

    process(CountDown, CountUp) is
    begin
        if (CountDown = CountUp) then
            report "Ping Go process 2!!";
        end if ;
    end process;
end sim;


