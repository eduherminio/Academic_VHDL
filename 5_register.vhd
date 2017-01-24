-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)


Entity registro is port(
	RST,DIR, LOAD, clock, en_ck: in bit;
	E: in bit_vector(3 downto 0);
	S: buffer bit_vector(3 downto 0));

attribute pin_numbers of registro: entity is
	"RST:2 en_ck:3 clock:1 DIR:4 LOAD:5 "
	& "E(0):9 E(1):8 E(2):7 E(3):6 "
	& "S(0):23 S(1):22 S(2):15 S(3):14";
end registro;

Architecture archregistro of registro is
Begin
	P1: process(clock,RST)
	Variable i: integer;
	Begin
		if(RST='1') then S <= "0000";
		elsif(clock'event and clock='1') then
			if (en_ck='0') then
				if(LOAD='1') then S <= E;
				elsif(DIR='1') then
					for i in 3 downto 1 loop
						S(i-1) <= S(i);
					end loop;
					S(3) <= S(0);
				elsif(DIR='0') then
					for i in 0 to 2 loop
						S(i+1) <= S(i);
					end loop;
					S(0) <= S(3);
				end if;
			end if;
		end if;
	end process P1;
end archregistro;
