library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity project2_3 is
    Port ( signal_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           valid : out  STD_LOGIC);
end project2_3;

architecture Behavioral of project2_3 is

signal duty_signal  : STD_LOGIC_VECTOR (15 downto 0);
signal freq_signal : STD_LOGIC_VECTOR (31 downto 0) ; 
signal valid_freq , valid_duty : STD_LOGIC := '0'; 

component duty_check is
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           signal_in : in  STD_LOGIC;
           valid : out  STD_LOGIC;
           duty_cycle : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component freq_check is 
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input_signal : in  STD_LOGIC;
           valid : out  STD_LOGIC;
           output_frequency : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

begin


u1: duty_check port map (

			  clk_in => clk,
           reset => reset,
           signal_in => signal_in,
           valid => valid_duty,
           duty_cycle => duty_signal

		);
		
u2: freq_check port map (

			  clk => clk,
           reset => reset,
           input_signal => signal_in,
           valid => valid_freq,
           output_frequency => freq_signal

		);

process(clk)
    begin
		  if reset = '1' then
				valid <= '0';
		  elsif freq_signal = 5000 and (duty_signal > 50 or duty_signal < 70) then
				valid <= '1' ;
		  else 
				valid<= '0';
		  end if;
end process;


end Behavioral;

