-- Authors:	Eduardo Cáceres de la Calle, Aarón Bueno Salamanca
-- Subject: 	Métodos y Herramientas de Diseño Electrónico
-- Degree: 	Industrial Electronics and Automatic Control Engineering
-- University:	Universidad de Valladolid (UVa) - EII

-- Code written in 2015, during my first contact with VHDL
-- Uploaded for educational purposes only, don't be too hard on me :)


entity BCD is
	port(	test:	 		in bit;
		punto_in:	 	in bit;
		punto_out:		out bit;
		entrada: in bit_vector(3 downto 0);
		salida:	 out bit_vector(6 downto 0));
		
	attribute pin_numbers of BCD: entity is
	"entrada(3):9 entrada(2):10 "
	& "entrada(1):11 entrada(0):13 " 
	& "test:1 punto_in:6 punto_out:17 "
	& "salida(6):21 salida(5):22 salida(4):19 "
	& "salida(3):18 salida(2):16 salida(1):20 salida(0):23";
end BCD;

architecture arch_BCD of BCD is
begin
--	--error
--	with punto_in select
--	punto_out<=	punto_in when '0',
--			punto_in when others;
--	
--	
--		--punto_out<= '0'; punto_in;
--	--error
	
	p1: process(punto_in, entrada, test)
	begin
	
	punto_out<= punto_in;
		
	if test<'1' then
		salida <= "1111111";
		
	else		
		case(entrada) is
			when "0000" => salida<= "0111111";
			when "0001" => salida<= "0000110";
			when "0010" => salida<= "1011011";
			when "0011" => salida<= "1001111";
			when "0100" => salida<= "1100110";
			when "0101" => salida<= "1101101";
			when "0110" => salida<= "1111101";
			when "0111" => salida<= "0000111";
			when "1000" => salida<= "1111111";
			when "1001" => salida<= "1101111";
			when others => salida<= "0000000";
		end case;
	end if;
	end process p1;
	
end arch_BCD;
	
	-- otro proceso para el punto
	
