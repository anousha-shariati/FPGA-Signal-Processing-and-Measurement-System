LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb2_1 IS
END tb2_1;
 
ARCHITECTURE behavior OF tb2_1 IS 
  
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT proj2_1
    PORT(
         clk : IN  std_logic;  
         reset : IN  std_logic; 
         input_signal : IN  std_logic;    
         valid : OUT  std_logic;  
         output_frequency : OUT  std_logic_vector(31 downto 0)
        );   
    END COMPONENT;             
         
     
   --Inputs 
   signal clk : std_logic := '0'; 
   signal reset : std_logic := '0'; 
   signal input_signal : std_logic := '0';

 	--Outputs
   signal valid : std_logic;
   signal output_frequency : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant input_signal_period : time :=2000000 ns;
 
BEGIN 
  
	-- Instantiate the Unit Under Test (UUT)
   uut: proj2_1 PORT MAP (
          clk => clk,
          reset => reset,
          input_signal => input_signal,
          valid => valid,
          output_frequency => output_frequency
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	input_signal_process :process
   begin
		input_signal<= '0';
		wait for input_signal_period/2;
		input_signal <= '1';
		wait for input_signal_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



      -- insert stimulus here 

      wait;
   end process;

END;
