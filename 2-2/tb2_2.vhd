LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb2_2 IS
END tb2_2;
 
ARCHITECTURE behavior OF tb2_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT project2_2
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         signal_in : IN  std_logic;
         valid : OUT  std_logic;
         duty_cycle : OUT  std_logic_vector(15 downto 0)
        ); 
    END COMPONENT;
     
 
   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';
   signal signal_in : std_logic := '0';

 	--Outputs
   signal valid : std_logic;
   signal duty_cycle : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_in_period : time := 20 ns;
	constant signal_in_period : time := 200 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: project2_2 PORT MAP (
          clk_in => clk_in,
          reset => reset,
          signal_in => signal_in,
          valid => valid,
          duty_cycle => duty_cycle
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
   signal_in_process :process
   begin
		signal_in <= '0';
		wait for signal_in_period/5;
		signal_in <= '1';
		wait for  4 * signal_in_period/5;
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
