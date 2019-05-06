----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:52:38 04/16/2019 
-- Design Name: 
-- Module Name:    Inversor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inversor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0);
	   Flag_Zero : out STD_LOGIC;
	   Flag_Negativo : out STD_LOGIC);
end Inversor;

architecture Behavioral of Inversor is

begin
	Gen_1: For I IN 3 downto 0 generate
			 saida(I) <= not x(I);
	end generate;
	Flag_Zero <= not (saida(0) or saida(1) or saida(2) or saida(3));
	Flag_Negativo <= saida(3);
end Behavioral;
