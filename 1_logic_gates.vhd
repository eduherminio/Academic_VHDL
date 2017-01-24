-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)

entity puertas is
	port(a,b:	in bit;
		s_and:	inout bit;
		s_nand:	out bit;
		s_or:	inout bit;
		s_nor:	inout bit;
		s_xor:	out bit;
		s_xnor:	out bit);

attribute pin_numbers of puertas: entity is
	"a:1 b:2 "
	& "s_and:14 s_or:15 "
	& "s_nand:16 s_nor:17 "
	& "s_xor:18 s_xnor:19 ";
end puertas;

architecture arch_puertas of puertas is
begin
	s_and <= a and b;
	s_nand <= not s_and;
	s_or <= a or b;
	s_nor <= not s_or;
	s_xor <= a xor b;
	s_xnor <= s_nor or s_and;
end arch_puertas;
