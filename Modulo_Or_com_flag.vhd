----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:24 04/02/2019 
-- Design Name: 
-- Module Name:    Modulo_Or - Behavioral 
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

entity Modulo_Or is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0);
	   Flag_Zero : out STD_LOGIC;
	   Flag_Sinal : out STD_LOGIC);
end Modulo_Or;

architecture Behavioral of Modulo_Or is

signal valor : std_logic_vector(3 downto 0);

begin
saida <= valor;
	Gen_1: For I IN 3 downto 0 generate
			 valor(I) <= x(I) or y(I);
	end generate;

	Flag_Zero <= not(valor(0) or valor(1) or valor(2) or valor(3));
	Flag_Sinal <= valor(3);
end Behavioral;
