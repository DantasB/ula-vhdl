--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:08:18 05/13/2019
-- Design Name:   
-- Module Name:   /home/ise/ulasd/vaicapeta.vhd
-- Project Name:  ulasd
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
 
ENTITY vaicapeta IS
END vaicapeta;
 
ARCHITECTURE behavior OF vaicapeta IS 
 
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
         Led5 : OUT  std_logic;
         Led6 : OUT  std_logic;
         Led7 : OUT  std_logic;
         Led8 : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal aalavanca1 : std_logic := '0';
   signal aalavanca2 : std_logic := '0';
   signal aalavanca3 : std_logic := '0';
   signal aalavanca4 : std_logic := '0';
   signal cclk : std_logic := '0';

 	--Outputs
   signal Leed1 : std_logic;
   signal Leed2 : std_logic;
   signal Leed3 : std_logic;
   signal Leed4 : std_logic;
   signal Leed5 : std_logic;
   signal Leed6 : std_logic;
   signal Leed7 : std_logic;
   signal Leed8 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contapain PORT MAP (
          aalavanca1,
          aalavanca2,
          aalavanca3,
          aalavanca4,
          Leed1,
          Leed2,
          Leed3,
          Leed4,
          Leed5,
          Leed6,
          Leed7,
          Leed8,
          cclk
        );

   -- Clock process definitions
   clk_process :process
   begin
		cclk <= '0';
		wait for clk_period/2;
		cclk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
