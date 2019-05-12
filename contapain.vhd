----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:09 05/07/2019 
-- Design Name: 
-- Module Name:    contapain - Behavioral 
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

entity contapain is
    Port ( alavanca1 : in  STD_LOGIC;
           alavanca2 : in  STD_LOGIC;
           alavanca3 : in  STD_LOGIC;
           alavanca4 : in  STD_LOGIC;
           Led1 : out  STD_LOGIC;
           Led2 : out  STD_LOGIC;
           Led3 : out  STD_LOGIC;
           Led4 : out  STD_LOGIC;
	   Led5 : out  STD_LOGIC;
           Led6 : out  STD_LOGIC;
           Led7 : out  STD_LOGIC;
           Led8 : out  STD_LOGIC;
		   clk: in std_logic
			  );
end contapain;

architecture Behavioral of contapain is
component ULA
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Operacao : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
	   Flag_Zero : out STD_LOGIC;
	   Flag_Sinal : out STD_LOGIC;
	   Flag_Overflow : out STD_LOGIC;
	   Flag_Cout : out STD_LOGIC
	   );
end component ULA;
signal clock : STD_LOGIC_VECTOR (7 downto 0);
signal vetor1 : STD_LOGIC_VECTOR (3 downto 0);
signal vetor2 : STD_LOGIC_VECTOR (3 downto 0);
signal result : STD_LOGIC_VECTOR (3 downto 0);
signal redutor : STD_LOGIC_VECTOR (‭27 downto 0)‬;
signal fzero : STD_LOGIC;
signal fsinal : STD_LOGIC;
signal fover : STD_LOGIC;
signal fcout : STD_LOGIC;
signal oparcione: STD_LOGIC_VECTOR (3 downto 0);
signal parte: STD_LOGIC;
begin
redutor <= "0000000000000000000000000000";
clock <= "00000000";
vetor1<= "0000";
vetor2<= "0000";
parte<='0';
oparcione(0) <= alavanca1;
oparcione(1) <= alavanca2; 
oparcione(2) <= alavanca3;
oparcione(3) <= alavanca4;
	ulala: ULA port map (vetor1, vetor2, oparcione, result, fzero, fsinal, fover, fcout);
	bigode: process(clk)
	begin
		case redutor is
			when "‭1011111010111100000111111111‬"	=>
			    redutor <= "0000000000000000000000000000";
				case parte is
				
					when '0'=>
					
				--if parte 0
						led1<= clock(0);
						led2<= clock(1);
						led3<= clock(2);
						led4<= clock(3);
						led5<= clock(4);
						led6<= clock(5);
						led7<= clock(6);
						led8<= clock(7);
					when '1'=>
				--if parte 1
						vetor1(0) <= clock(0);
						vetor1(1) <= clock(1);
						vetor1(2) <= clock(2);
						vetor1(3) <= clock(3);
						vetor2(0) <= clock(4);
						vetor2(1) <= clock(5);
						vetor2(2) <= clock(6);
						vetor2(3) <= clock(7);
						led1<= result(0);
						led2<= result(1);
						led3<= result(2);
						led4<= result(3);
						led5<= fzero;
						led6<= fsinal;
						led7<= fover;
						led8<= fcout;
						--sempre ocorre
						clock += "00000001";
						parte = not parte;
					when others =>
						parte = not parte;
				end case;
			when others =>
				redutor += "0000000000000000000000000001";
		end case;
	end process bigode;


end Behavioral;
