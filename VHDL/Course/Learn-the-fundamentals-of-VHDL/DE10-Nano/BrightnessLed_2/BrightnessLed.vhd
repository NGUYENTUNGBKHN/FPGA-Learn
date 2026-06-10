-- Brightness Led

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity BrightnessLed is
    generic(
        INPUT_CLK   : integer := 50000000;
        LED_NUMS    : integer := 8
    );
    port (
        LED_OUT     : out std_logic_vector(LED_NUMS - 1 downto 0);
        CLK         : in std_logic;
        ENABLE      : in std_logic
    );
end entity;

-- Architecture
architecture behavior of BrightnessLed is
-- component
    component COUNTER is
        generic (
            MAX_VAL : integer := 2**30;
            SYNC_rst : boolean := true
        );
        port (
            Max_cnt : out std_logic;
            CLK     : in std_logic;
            Reset   : in std_logic
        );
    end component;

    component PWM is
        generic (
            INPUT_CLK : integer := 50000000;
            BIT_NUMS : integer := 8;
            FREQ : integer := 50
        );
        port (
            CLK : in std_logic;
            Duty_Cycle : in std_logic_vector(BIT_NUMS - 1 downto 0);
            Enable : in std_logic;
            PWM_OUT : out std_logic
        );
    end component;
-- constant
    constant MAX_COUNTER : integer := INPUT_CLK/85;
    constant BIT_NUMS : integer := 8;
    constant MAX_DUTY : integer := 2**BIT_NUMS;
	constant SYNC_rst : boolean := true;
-- signal
    
    signal max_cnt_reg : std_logic := '0';
    signal led_out_reg : std_logic := '0';
    signal max_duty_cnt : unsigned(BIT_NUMS - 1 downto 0) := (others => '0');

begin
    LED_OUT <= (others => led_out_reg);
    i_Counter : COUNTER
        generic map(MAX_COUNTER, SYNC_rst)
        port map(Max_cnt => max_cnt_reg, CLK => CLK, Reset => ENABLE);

    i_PWM : PWM
        generic map(INPUT_CLK, BIT_NUMS, 50)
        port map(CLK => CLK, Duty_Cycle => std_logic_vector(max_duty_cnt), Enable => NOT ENABLE, PWM_OUT => led_out_reg);
    
    out_proc : process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (max_duty_cnt = MAX_DUTY) then
                max_duty_cnt <= (others => '0');
            elsif (max_cnt_reg = '1') then
                max_duty_cnt <= max_duty_cnt + 1;
            end if;
        end if;
    end process;
end architecture;


