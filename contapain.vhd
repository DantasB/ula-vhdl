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
    Port ( alavancas : in  STD_LOGIC_VECTOR (3 downto 0);
           leds : out  STD_LOGIC_VECTOR (3 downto 0);
			  step : out  STD_LOGIC_VECTOR (3 downto 0);--step 1 esta sendo mostrado vetor 1,2: vetor 2, 3: resultado, 4:flags
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

signal vetor1 : STD_LOGIC_VECTOR (3 downto 0):= "0000";-- primeiro vetor de 4 bits que entra na ula
signal vetor2 : STD_LOGIC_VECTOR (3 downto 0):= "0000";-- segundo vetor de 4 bits que entra na ula
signal vetorcontador : UNSIGNED(7 downto 0):= "00000000";-- 4 primeiros bits serao o vetor 1 4 ultimos vetor 2, soma 1 a cada clock reduzido
signal result : STD_LOGIC_VECTOR (3 downto 0):= "0000";-- resultado da ula
signal fzero : STD_LOGIC := '0';-- flags
signal fsinal : STD_LOGIC:= '0';
signal fover : STD_LOGIC:= '0';
signal fcout : STD_LOGIC:= '0';
begin
vetor1(0)<= vetorcontador(0);
vetor1(1)<= vetorcontador(1);
vetor1(2)<= vetorcontador(2);
vetor1(3)<= vetorcontador(3);
vetor2(0)<= vetorcontador(4);
vetor2(1)<= vetorcontador(5);
vetor2(2)<= vetorcontador(6);
vetor2(3)<= vetorcontador(7);
ulala: ULA port map (vetor1, vetor2, alavancas, result, fzero, fsinal, fover, fcout);
	process(clk)
		variable parte : INTEGER RANGE 15 DOWNTO 0:=0;
		variable redutor : INTEGER RANGE 200_000_000 DOWNTO 0:=0;
		begin
			if (clk'event and clk = '1') then 
			if (redutor >= 200_000_000) then -- o clock de verdade so ocorre quando o redutor chego no valor limite
				redutor := 0;
				if (parte = 0) then
					leds <= vetor1;
					step <= "0001";
				elsif (parte = 1) then
					leds <= vetor2;
					step <= "0010";
				elsif (parte = 2) then
					leds <= result;
					step <= "0011";
				elsif (parte = 3) then
					Leds(0) <= fzero;
					Leds(1) <= fsinal;
					Leds(2) <= fover;
					Leds(3) <= fcout;
					step <= "0100";
				else
					vetorcontador<= vetorcontador + 1;
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
