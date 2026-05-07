-- while loop

entity While_Loop is
end entity;

architecture sim of While_Loop is
begin
    process is
        variable i : integer := 0;
    begin
        report "Welcome to while loop !";

        while (i < 10) loop
            report "i = " & integer'image(i);
            i := i + 2;
        end loop;
        wait;
    end process;
end sim;



