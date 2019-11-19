

-- 3 Giriþli AND KAPISI
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3_kapisi is
	port( and_g1: in STD_LOGIC;
			and_g2: in STD_LOGIC;
			and_g3: in STD_LOGIC;
			and_cikis: out STD_LOGIC
		  );
end and3_kapisi;
architecture Behavioral of and3_kapisi is

begin
	process(and_g1, and_g2, and_g3)
	begin
		and_cikis <= and_g1 and and_g2 and and_g3;
		end process;
end Behavioral;


-- 2 Giriþli AND KAPISI
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and2_kapisi is
	port( and2_g1: in STD_LOGIC;
			and2_g2: in STD_LOGIC;
			and2_cikis: out STD_LOGIC);
end and2_kapisi;

architecture Behavioral of and2_kapisi is
	begin
		process(and2_g1, and2_g2)
		begin
			and2_cikis <= and2_g1 and and2_g2;
		end process;
end Behavioral;
		
-- NOT KAPISI
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_kapisi is
	 port ( not_g1: in STD_LOGIC;
				not_cikis: out STD_LOGIC);
end not_kapisi;
architecture Behavioral of not_kapisi is
begin
	process(not_g1)
	begin 
		not_cikis <= not(not_g1);
		end process;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GENEL is
	port(t0 : in STD_LOGIC;
		  t1: in STD_LOGIC;
		  t2: in STD_LOGIC;
		  E : in STD_LOGIC;
		  x: out STD_LOGIC_VECTOR(7 downto 0));
end GENEL;
architecture Behavioral of GENEL is
	component Decoder2_4 is
			port(	X0: in STD_LOGIC;
			X1: in STD_LOGIC;
			Enable: in STD_LOGIC;
			Y : OUT STD_LOGIC_VECTOR(3 downto 0)
			);
	end component;
	component and2_kapisi is
		port( and2_g1: in STD_LOGIC;
			and2_g2: in STD_LOGIC;
			and2_cikis: out STD_LOGIC);
	end component;
	component not_kapisi is
	port(	not_g1: in STD_LOGIC;
			not_cikis: OUT STD_LOGIC
			);
	end component;
	
	 signal kablot2 : STD_LOGIC;
	 signal cikis1 : STD_LOGIC;
	 signal cikis2 : STD_LOGIC;
	begin
		blok1: not_kapisi port map(t2,kablot2);
		blok2: and2_kapisi port map(kablot2,E,cikis1);
		blok3: and2_kapisi port map(t2,E,cikis2);
		blok4: Decoder2_4 port map(t0,t1,cikis1,x(3 downto 0));
		blok5: Decoder2_4 port map(t0,t1,cikis2,x(7 downto 4));
	end Behavioral;
	
	

-- 2-4 DECODER
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder2_4 is
	port(	X0: in STD_LOGIC;
			X1: in STD_LOGIC;
			Enable: in STD_LOGIC;
			Y : OUT STD_LOGIC_VECTOR(3 downto 0)
			);
end Decoder2_4;


architecture Behavioral of Decoder2_4 is

component not_kapisi is
	port(	not_g1: in STD_LOGIC;
			not_cikis: OUT STD_LOGIC
			);
end component;

component and3_kapisi is
	port(	and_g1: in STD_LOGIC;
			and_g2: in STD_LOGIC;
			and_g3: in STD_LOGIC;
			and_cikis: OUT STD_LOGIC
			);
end component;

signal arakablo1 : STD_LOGIC;
signal arakablo2 : STD_LOGIC;

begin
	blok1 : not_kapisi port map(X1, arakablo1);
	blok2 : not_kapisi port map(X0, arakablo2);
	blok3 : and3_kapisi port map(arakablo2,arakablo1,Enable,Y(0));
	blok4 : and3_kapisi port map(X0,arakablo1,Enable,Y(1));
	blok5 : and3_kapisi port map(arakablo2,X1,Enable,Y(2));
	blok6 : and3_kapisi port map(X0,X1,Enable,Y(3));

end Behavioral;


