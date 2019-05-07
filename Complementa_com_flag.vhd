----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:58 04/02/2019 
-- Design Name: 
-- Module Name:    Complementa - Behavioral 
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

entity Complementa is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0);
           Flag_Zero : out STD_LOGIC;
           Flag_Sinal : out STD_LOGIC);
end Complementa;

architecture Behavioral of Complementa is

COMPONENT somapain4
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC_VECTOR (3 downto 0);
           Flag_Zero : out STD_LOGIC;
           Flag_Sinal : out STD_LOGIC;
           Flag_Overflow : out STD_LOGIC);
    
end COMPONENT somapain4;

SIGNAL inverso: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL resultado: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL um: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL complementado: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL cout: std_logic;
SIGNAL Flag_Zero_somador: std_logic;
SIGNAL Flag_Sinal_somador: std_logic;
SIGNAL Flag_Overflow_somador: std_logic;

begin

inverso <= NOT(X);

um(0) <= '1';
um(1) <= '0';
um(2) <= '0';
um(3) <= '0';
label2: somapain4 port map (inverso, um, '0', cout, complementado, Flag_Zero_somador, Flag_Sinal_somador, Flag_Overflow_somador);
saida <= complementado;
Flag_Zero <= not(complementado(0) or complementado(1) or complementado(2) or complementado(3));
Flag_Sinal <= complementado(3);


end Behavioral;

