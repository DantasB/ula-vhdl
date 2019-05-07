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
	   saida : out  STD_LOGIC_VECTOR (3 downto 0);
	   Flag_Zero : out STD_LOGIC;
	   Flag_Overflow : out STD_LOGIC;
	   Flag_Sinal : out STD_LOGIC;
	   Flag_Borrow : out STD_LOGIC
			  );
end subtratain4;

architecture Behavioral of subtratain4 is

COMPONENT somapain4
    PORT(
         cin : IN  std_logic;
         x : in  STD_LOGIC_VECTOR (3 downto 0);
         y : in  STD_LOGIC_VECTOR (3 downto 0);
         cout : out  std_logic;
         saida : out  STD_LOGIC_VECTOR (3 downto 0);
	 Flag_Zero : out STD_LOGIC;
	 Flag_Overflow : out STD_LOGIC;
	 Flag_Sinal : out STD_LOGIC
        );
		  
end COMPONENT somapain4;

COMPONENT Complementa
    PORT(
        x : in  STD_LOGIC_VECTOR (3 downto 0);
	saida : out  STD_LOGIC_VECTOR (3 downto 0);
	Flag_Zero : out STD_LOGIC;
	Flag_Sinal : out STD_LOGIC
        );
		  
end COMPONENT Complementa;

SIGNAL ynvertido: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL resultado: std_logic_vector (3 downto 0);
SIGNAL Flag_Zero_somador: std_logic;
SIGNAL Flag_Sinal_somador: std_logic;
SIGNAL Flag_Overflow_somador: std_logic;

begin

	a0:Complementa port map(y, ynvertido);
	a1:somapain4 port map (bin, x, ynvertido, bout, resultado, Flag_Zero_somador, Flag_Sinal_somador, Flag_Overflow_somador);
	saida <= resultado;
	Flag_Zero <= not(resultado(0) or resultado(1) or resultado(2) or resultado(3));
	Flag_Overflow <= Flag_Overflow_somador;
	Flag_Borrow <= not bout;
	Flag_Sinal <= resultado(3);

end Behavioral;
