-- Conditional Statement

-- Entity
entity ConditionalStatement is
end entity;

-- Architecture
architecture sim of ConditionalStatement is
-- Singal 
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
        if CountUp > CountDown then
            report "CountUp larger" & "(" &
                integer'image(CountUp) & "-" &
                integer'image(CountDown) & ")";
        elsif CountUp < CountDown then
            report "CountUp smaller" & "(" &
                integer'image(CountUp) & "-" &
                integer'image(CountDown) & ")";
        else
            report "They are equal";
        end if;
        wait on CountDown, CountUp;
    end process;
end sim;



