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
use IEEE.NUMERIC_STD.ALL;

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
			  op1 : out  STD_LOGIC;
           op2 : out  STD_LOGIC;
           op3 : out  STD_LOGIC;
           op4 : out  STD_LOGIC;
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

signal inutil : STD_LOGIC_VECTOR (7 downto 0):= "00000000";
signal vetor1 : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal vetor2 : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal vetorgrande : UNSIGNED(7 downto 0):= "00000000";
signal result : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal fzero : STD_LOGIC := '0';
signal fsinal : STD_LOGIC:= '0';
signal fover : STD_LOGIC:= '0';
signal fcout : STD_LOGIC:= '0';
signal oparcione: STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal carrie : STD_LOGIC:= '0';
begin
vetor1(0)<= vetorgrande(0);
vetor1(1)<= vetorgrande(1);
vetor1(2)<= vetorgrande(2);
vetor1(3)<= vetorgrande(3);
vetor2(0)<= vetorgrande(4);
vetor2(1)<= vetorgrande(5);
vetor2(2)<= vetorgrande(6);
vetor2(3)<= vetorgrande(7);
oparcione(0) <= alavanca1;
oparcione(1) <= alavanca2; 
oparcione(2) <= alavanca3;
oparcione(3) <= alavanca4;
ulala: ULA port map (vetor1, vetor2, oparcione, result, fzero, fsinal, fover, fcout);
	process(clk)
		variable parte : INTEGER RANGE 15 DOWNTO 0:=0;
		variable redutor : INTEGER RANGE 200_000_000 DOWNTO 0:=0;
		begin
			if (clk'event and clk = '1') then 
			if (redutor >= 10) then
				redutor := 0;
				if (parte = 0) then
					Led1 <= vetor1(0);
					Led2 <= vetor1(1);
					Led3 <= vetor1(2);
					Led4 <= vetor1(3);
					op1 <= '1';
					op2 <= '0';
					op3 <= '0';
					op4 <= '0';
				elsif (parte = 1) then
					Led1 <= vetor2(0);
					Led2 <= vetor2(1);
					Led3 <= vetor2(2);
					Led4 <= vetor2(3);
					op1 <= '0';
					op2 <= '1';
					op3 <= '0';
					op4 <= '0';
				elsif (parte = 2) then
					Led1 <= result(0);
					Led2 <= result(1);
					Led3 <= result(2);
					Led4 <= result(3);
					op1 <= '1';
					op2 <= '1';
					op3 <= '0';
					op4 <= '0';
				elsif (parte = 3) then
					Led1 <= fzero;
					Led2 <= fsinal;
					Led3 <= fover;
					Led4 <= fcout;
					op1 <= '0';
					op2 <= '0';
					op3 <= '1';
					op4 <= '0';
				else
					vetorgrande<= vetorgrande + 1;
				end if;
				if (parte = 4) then
					parte := 0;
				else
					parte := parte + 1;
				end if;
			else
				redutor := redutor + 1;
			end if;
		 end if;
	end process;
end Behavioral;
