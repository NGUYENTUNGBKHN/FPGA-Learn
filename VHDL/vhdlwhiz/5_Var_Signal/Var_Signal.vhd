
-- Variable and Signal

-- Entity
entity Var_Signal is
end entity;

-- Architecture
architecture sim of Var_Signal is
-- Signal
signal My_Signal : integer := 0;

begin
    process is
    -- Variable
    variable My_Var : integer := 0;
    begin
        report "Process begin";
        My_Signal <= My_Signal + 1;
        My_Var := My_Var + 1;

        report "My Variable = " & integer'image(My_Var) &
            ", My Signal = " & integer'image(My_Signal);
        
        My_Signal <= My_Signal + 1;
        My_Var := My_Var + 1;

        report "My Variable = " & integer'image(My_Var) &
            ", My Signal = " & integer'image(My_Signal);
        
        wait for 10 ns;

        report "My Variable = " & integer'image(My_Var) &
            ", My Signal = " & integer'image(My_Signal);

    end process;
end sim;


