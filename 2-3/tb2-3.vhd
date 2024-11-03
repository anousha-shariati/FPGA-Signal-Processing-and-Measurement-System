LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb2_3 IS
END tb2_3;
 
ARCHITECTURE behavior OF tb2_3 IS 
 
 
    COMPONENT project2_3
    PORT(
         signal_in : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal signal_in : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant signal_in_period : time := 100000000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: project2_3 PORT MAP (
          signal_in => signal_in,
          clk => clk,
          reset => reset,
          valid => valid
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	signal_in_process :process
   begin
		signal_in <= '0';
		wait for signal_in_period/2;
		signal_in <= '1';
		wait for signal_in_period/2;
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
