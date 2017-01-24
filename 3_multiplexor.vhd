-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)


-- Multiplexor G1M5
entity multi_4 is
port(	entrada: in bit_vector(3 downto 0);
	seleccion: in bit_vector(1 downto 0);
	salida: out bit);
end multi_4;

architecture archi_multi_4 of multi_4 is
begin
with seleccion select
salida<= 	entrada(0) when "00",
		entrada(1) when "01",
		entrada(2) when "10",
		entrada(3) when others;
end archi_multi_4;
