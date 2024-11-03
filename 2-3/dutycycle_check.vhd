library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity duty_check is
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           signal_in : in  STD_LOGIC;
           valid : out  STD_LOGIC;
           duty_cycle : out  STD_LOGIC_VECTOR (15 downto 0));
end duty_check;

architecture Behavioral of duty_check is

signal counter : INTEGER := 0;
signal counter1 : INTEGER := 0;
signal valid_duty : std_logic;
	 
begin

process(clk_in)
    begin
		  if reset = '1' then
				counter <= 0;
				
		  elsif rising_edge(signal_in) then				
				COUNTER<=0;
				
		  elsif falling_edge(signal_in) then
				   counter1 <= counter;
					counter<= 0;
		  end if;				
				
        if rising_edge(clk_in) then
				counter <= counter + 1;
			end if;
			
		  if std_logic_vector(to_unsigned((counter1*10) , 16)) < 100 then
                valid_duty <= '1';
            else
                valid_duty <= '0';
        end if;
  
    end process;

duty_cycle <= std_logic_vector(to_unsigned((counter1 *10) , 16));
valid <= valid_duty ;
end Behavioral;



    

