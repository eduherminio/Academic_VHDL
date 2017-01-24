-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)

-- Dado

use work.int_math.all;

entity dado is port(
	reloj, marcha: in bit;
	D: inout bit_vector(1 to 7));

attribute pin_numbers of dado: entity is
"reloj:1 marcha:2 "
& "D(1):20 D(2):19 D(3):17 D(4):18 "
& "D(5):15 D(6):14 D(7):16";
end dado;

architecture arq_dado of dado is
signal cuenta: bit_vector(2 downto 0);
begin
	p1: process(reloj,marcha)
	begin
		if reloj 'event and reloj = '1' then
			if marcha= '1' then
				cuenta <= cuenta+1;
				if cuenta= "110" then cuenta <="000";
				end if;
			end if;
		end if;
	end process p1;
	
with cuenta select
-- Nivel alto 
--D<=	"0010000" when "000",
--	"0001010" when "001",
--	"0011010" when "010",
--	"1001011" when "011",
--	"1011011" when "100",
--	"1101111" when "101",
--	"0010000" when others;

-- Nivel bajo -> funciona mejor

D<=	"1101111" when "000",
	"1110101" when "001",
	"1100101" when "010",
	"0110100" when "011",
	"0100100" when "100",
	"0010000" when "101",
	"1101111" when others;


end arq_dado;
