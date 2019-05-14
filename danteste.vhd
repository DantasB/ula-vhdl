--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:49:54 05/14/2019
-- Design Name:   
-- Module Name:   /home/sd/bdantas/danteste.vhd
-- Project Name:  bdantas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contapain
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
 
ENTITY danteste IS
END danteste;
 
ARCHITECTURE behavior OF danteste IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contapain
    PORT(
         alavanca1 : IN  std_logic;
         alavanca2 : IN  std_logic;
         alavanca3 : IN  std_logic;
         alavanca4 : IN  std_logic;
         Led1 : OUT  std_logic;
         Led2 : OUT  std_logic;
         Led3 : OUT  std_logic;
         Led4 : OUT  std_logic;
         op1 : OUT  std_logic;
         op2 : OUT  std_logic;
         op3 : OUT  std_logic;
         op4 : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal alavanca1 : std_logic := '0';
   signal alavanca2 : std_logic := '0';
   signal alavanca3 : std_logic := '0';
   signal alavanca4 : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Led1 : std_logic;
   signal Led2 : std_logic;
   signal Led3 : std_logic;
   signal Led4 : std_logic;
   signal op1 : std_logic;
   signal op2 : std_logic;
   signal op3 : std_logic;
   signal op4 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contapain PORT MAP (
          alavanca1 => alavanca1,
          alavanca2 => alavanca2,
          alavanca3 => alavanca3,
          alavanca4 => alavanca4,
          Led1 => Led1,
          Led2 => Led2,
          Led3 => Led3,
          Led4 => Led4,
          op1 => op1,
          op2 => op2,
          op3 => op3,
          op4 => op4,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		alavanca1<='1';
		alavanca2<='1';
		alavanca3<='0';
		alavanca4<='0';
		
		

      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
