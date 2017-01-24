-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)


-- Contador 4 bits

use work.int_math.all;

entity cont4 is port(
	reloj, reloj_en, carga: in bit;
	dato_carga: in bit_vector(3 downto 0);
	salida: out bit_vector(3 downto 0));

attribute pin_numbers of cont4: entity is
"reloj:1 reloj_en:2 carga:3 "
& "dato_carga(3):4 dato_carga(2):5 dato_carga(1):6 dato_carga(0):7 "
& "salida(3):14 salida(2):15 salida(1):22 salida(0):23";
end cont4;

architecture arq_cont4 of cont4 is
signal cuenta: bit_vector(3 downto 0);
begin
	p1: process(reloj,carga)
	begin
		if reloj 'event and reloj = '1' then
			if reloj_en = '1' then
				if(carga='1') then
					cuenta <= dato_carga;
				else
					cuenta <= cuenta+1;
				end if;
			end if;
		end if;
	end process p1;
salida <= cuenta;
end arq_cont4;
