-- Test Bench Brightness LED (VHDL-93 Compliant)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testBench is
end entity;

architecture sim of testBench is
    -- Component
    component BrightnessLed is
        generic (
            INPUT_CLK : integer := 125000000;
            LED_NUMS : integer := 2
        );
        port(
            CLK : in std_logic;
            Enable : in std_logic;
            LED_PWM : out std_logic_vector(LED_NUMS - 1 downto 0)
        );
    end component;

    -- Constants
    constant INPUT_CLK : integer := 25600;
    constant LED_NUMS : integer := 2;
    constant CLK_PERIOD : time := 39062.5 ns;

    -- Signals
    signal CLK : std_logic := '1';
    signal enable : std_logic := '0';
    signal LED_PWM : std_logic_vector(LED_NUMS - 1 downto 0) := (others => '0');
begin

    CLK <= not CLK after CLK_PERIOD / 2;

    -- Device Under Test (DUT)
    i_Test : BrightnessLed
        generic map(INPUT_CLK => INPUT_CLK, LED_NUMS => LED_NUMS)
        port map(CLK => CLK, Enable => enable, LED_PWM => LED_PWM);

    -- Stimulus process
    process is
    begin
        wait until rising_edge(CLK);
        wait until rising_edge(CLK);

        enable <= '1';

        wait;
    end process;

end architecture;
