--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:11:34 05/14/2019
-- Design Name:   
-- Module Name:   /home/sd/bdantas/subtrataintest.vhd
-- Project Name:  bdantas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: subtratain4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY subtrataintest IS
END subtrataintest;
 
ARCHITECTURE behavior OF subtrataintest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT subtratain4
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         bin : IN  std_logic;
         bout : OUT  std_logic;
         saida : OUT  std_logic_vector(3 downto 0);
         Flag_Zero : OUT  std_logic;
         Flag_Overflow : OUT  std_logic;
         Flag_Sinal : OUT  std_logic;
         Flag_Borrow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');
   signal bin : std_logic := '0';

 	--Outputs
   signal bout : std_logic;
   signal saida : std_logic_vector(3 downto 0);
   signal Flag_Zero : std_logic;
   signal Flag_Overflow : std_logic;
   signal Flag_Sinal : std_logic;
   signal Flag_Borrow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: subtratain4 PORT MAP (
          x => x,
          y => y,
          bin => bin,
          bout => bout,
          saida => saida,
          Flag_Zero => Flag_Zero,
          Flag_Overflow => Flag_Overflow,
          Flag_Sinal => Flag_Sinal,
          Flag_Borrow => Flag_Borrow
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		x<="0011";
		y<="0111";
		bin<='0';



      -- insert stimulus here 

      wait;
   end process;

END;
