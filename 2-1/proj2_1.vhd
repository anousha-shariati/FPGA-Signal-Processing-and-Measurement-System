library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity proj2_1 is 
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input_signal : in  STD_LOGIC;
           valid : out  STD_LOGIC;
           output_frequency : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end proj2_1;

architecture Behavioral of proj2_1 is

signal counter : integer :=0 ; 
signal clk_counter : integer :=0 ;
signal freq_counter : integer :=0 ;
signal valid_freq : STD_LOGIC := '0';  -- 1--> valid       0-->invalid 
  
    
begin         
process(clk, reset)    
             
    begin 
        if reset = '1' then  
            counter <= 0;
            valid_freq <= '0' ; 
				
		  elsif rising_edge(input_signal) then	  
                counter <= clk_counter; 
	--				 counter <= counter * 20 ;
	--				 freq_counter <= 1/counter;
                clk_counter <= 0;				 
		  end if;
				
        if rising_edge(clk) then				
            clk_counter <= clk_counter + 1;
		  end if;			
            if std_logic_vector(to_unsigned(counter,32))> 50000 or 
					std_logic_vector(to_unsigned(counter,32))< 50  then
                valid_freq <= '0';
            else
                valid_freq <= '1';
            end if;       
    end process;

    output_frequency<= std_logic_vector(to_unsigned(counter,32));
    valid <= valid_freq;


end Behavioral;


