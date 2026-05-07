-- FOR Loop

-- Entity
entity ForLoop is
end entity;

architecture sim of ForLoop is
begin 
    process is
    begin
        report "wellcome !!";
        for i in 1 to 10 loop
            report "i= " & integer'image(i);
        end loop;
        wait;
    end process;
end sim;


