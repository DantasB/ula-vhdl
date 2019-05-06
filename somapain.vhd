----------------------------------------------------------------------------------
-- Company: UFRJ 
-- Engineer: Bergman e CIA
-- 
-- Create Date:    15:32:24 03/26/2019 
-- Design Name: 
-- Module Name:    somapain - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 1
-- Description: somador de hum(1) bit 
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

entity somapain is
    Port ( cin : in  STD_LOGIC;
           x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC);
end somapain;

architecture Behavioral of somapain is
SIGNAL k1, k2, k3, k4, kfinal : STD_LOGIC;

begin
	k1 <= x and y;
	k2 <= x and cin;
	k3 <= y and cin;
	k4 <= k1 or k2;
	cout <= k3 xor k4; 
	kfinal <= x XOR y;
	saida <= kfinal xor cin;
end Behavioral;

