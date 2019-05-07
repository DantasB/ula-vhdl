----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:52 04/16/2019 
-- Design Name: 
-- Module Name:    subtratain4 - Behavioral 
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

entity subtratain4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           bin : in  STD_LOGIC;
           bout : out  STD_LOGIC;
			  saida : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end subtratain4;

architecture Behavioral of subtratain4 is

COMPONENT somapain4
    PORT(
         cin : IN  std_logic;
         x : in  STD_LOGIC_VECTOR (3 downto 0);
         y : in  STD_LOGIC_VECTOR (3 downto 0);
         cout : OUT  std_logic;
         saida : out  STD_LOGIC_VECTOR (3 downto 0)
        );
		  
end COMPONENT somapain4;

COMPONENT Complementa
    PORT(
        x : in  STD_LOGIC_VECTOR (3 downto 0);
		  saida : out  STD_LOGIC_VECTOR (3 downto 0)
        );
		  
end COMPONENT Complementa;

signal ynvertido: STD_LOGIC_VECTOR (3 downto 0);
signal resultado: std_logic_vector (3 downto 0);

begin

a0:Complementa port map(y, ynvertido);
a1:somapain4 port map (bin, x, ynvertido, bout, resultado);
saida <= resultado;

end Behavioral;

