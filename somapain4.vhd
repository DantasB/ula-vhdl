----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:46 03/26/2019 
-- Design Name: 
-- Module Name:    somapain4 - Behavioral 
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

entity somapain4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end somapain4;


architecture Behavioral of somapain4 is

COMPONENT somapain
    PORT(
         cin : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         cout : OUT  std_logic;
         saida : OUT  std_logic
        );
END COMPONENT somapain;

signal prop: std_logic_vector(2 downto 0);

begin

a0: somapain port map (cin, x(0), y(0), prop(0), saida(0));
a1: somapain port map (prop(0), x(1), y(1), prop(1), saida(1));
a2: somapain port map (prop(1), x(2), y(2), prop(2), saida(2));
a3: somapain port map (prop(2), x(3), y(3), cout, saida(3));
end Behavioral;

