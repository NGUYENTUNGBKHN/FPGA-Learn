-- Use Loop and Exit in VHDL

-- Entity
entity Loop_Exit is
end entity;

architecture sim of Loop_Exit is
begin

    process is
    begin
        report "wellcome !!";

        loop 

            report "passed ";
            exit;
        end loop;
        wait;
    end process;
end sim;


