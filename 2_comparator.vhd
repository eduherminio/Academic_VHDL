-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)


-- Comparador de 1 bit

entity comp_1bit is port(
	ai, bi, e: in bit;
	aigb: out bit);
end comp_1bit;

architecture arq_comp1 of comp_1bit is
	begin
		aigb <= (ai xnor bi) and E;
end arq_comp1;

-- Comparador de 4 bits

entity comp_4bit is port(
	dato_a, dato_b: in bit_vector(3 downto 0);
	enable:		in bit;
	x1, x2, x3:	inout bit; 	-- inout
	igual:		out bit);
end comp_4bit;

architecture arq_comp4 of comp_4bit is
	 --signal x1, x2, x3: bit;	-- signal
	begin
		Cmp3: comp_1bit port map (dato_a(3), dato_b(3), enable, x3);
		Cmp2: comp_1bit port map (dato_a(2), dato_b(2), x3, x2);
		Cmp1: comp_1bit port map (dato_a(1), dato_b(1), x2, x1);
		Cmp0: comp_1bit port map (dato_a(0), dato_b(0), x1, igual);
end arq_comp4;
