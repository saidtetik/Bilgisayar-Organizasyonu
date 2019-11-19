
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VE_KAPISI is
	port(	ve_g1:in STD_LOGIC;
			ve_g2:in STD_LOGIC;
			ve_cikis:out STD_LOGIC);
end VE_KAPISI;

architecture veri_akisi of VE_KAPISI is
begin
	process(ve_g1,ve_g2)
	begin
		ve_cikis <= ve_g1 and ve_g2;
	end process;
end veri_akisi;
-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VEYA_KAPISI is
	port(	veya_g1: in STD_LOGIC;
			veya_g2: in STD_LOGIC;
			veya_cikis: out STD_LOGIC);
end VEYA_KAPISI;

architecture veri_akisi of VEYA_KAPISI is
begin
	process(veya_g1, veya_g2)
	begin
		veya_cikis <= veya_g1 or veya_g2;
	end process;
end veri_akisi;
-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_KAPISI is
	port(	xor_g1: in STD_LOGIC;
			xor_g2: in STD_LOGIC;
			xor_cikis: out STD_LOGIC);
end XOR_KAPISI;

architecture veri_akisi of XOR_KAPISI is
begin
	process(xor_g1, xor_g2)
	begin
		xor_cikis <= xor_g1 xor xor_g2;
	end process;
end veri_akisi;
----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity YT is
	port(	yt_g1: in STD_LOGIC;
			yt_g2: in STD_LOGIC;
			yt_toplam: out STD_LOGIC;
			yt_eldecikisi: out STD_LOGIC);
end YT;

architecture yapisal of YT is
	component VE_KAPISI is
		port(	ve_g1:in STD_LOGIC;
				ve_g2:in STD_LOGIC;
				ve_cikis:out STD_LOGIC);
	end component;
	component XOR_KAPISI is
		port(	xor_g1: in STD_LOGIC;
				xor_g2: in STD_LOGIC;
				xor_cikis: out STD_LOGIC);
	end component;
begin
	blok1: XOR_KAPISI port map(xor_g1 => yt_g1, xor_g2 => yt_g2, xor_cikis => yt_toplam);
	blok2: VE_KAPISI port map(ve_g1 => yt_g1, ve_g2 => yt_g2, ve_cikis => yt_eldecikisi);
end yapisal;
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TT is
	port(	tt_g1: in STD_LOGIC;
			tt_g2: in STD_LOGIC;
			tt_eldegirisi: in STD_LOGIC;
			tt_toplam: out STD_LOGIC;
			tt_eldecikisi: out STD_LOGIC
	);
end TT;

architecture yapisal of TT is
	component YT is
		port(	yt_g1: in STD_LOGIC;
				yt_g2: in STD_LOGIC;
				yt_toplam: out STD_LOGIC;
				yt_eldecikisi: out STD_LOGIC);
	end component;
	component  VEYA_KAPISI is
		port(	veya_g1: in STD_LOGIC;
				veya_g2: in STD_LOGIC;
				veya_cikis: out STD_LOGIC);
	end component;
	signal arakablo1: STD_LOGIC;
	signal arakablo2: STD_LOGIC;
	signal arakablo3: STD_LOGIC;
begin
	blok1: YT port map(yt_g1 => tt_g1, yt_g2 => tt_g2, yt_eldecikisi => arakablo2, 
	yt_toplam => arakablo1);
	blok2: YT port map(yt_g1 => arakablo1, yt_g2 => tt_eldegirisi, 
	yt_eldecikisi => arakablo3, yt_toplam => tt_toplam);
	blok3: VEYA_KAPISI port map(veya_g1 => arakablo2, veya_g2 => arakablo3, 
	veya_cikis => tt_eldecikisi);
end yapisal;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity devre is
	port (A: in STD_LOGIC_VECTOR(3 downto 0);
			B: in STD_LOGIC_VECTOR(3 downto 0);
			X: in STD_LOGIC;
			S: out STD_LOGIC_VECTOR(4 downto 0));
end devre;

architecture Behavioral of devre is
	component XOR_KAPISI is
		port(	xor_g1: in STD_LOGIC;
				xor_g2: in STD_LOGIC;
				xor_cikis: out STD_LOGIC);
	end component;
	
	component TT is
	port(	tt_g1: in STD_LOGIC;
			tt_g2: in STD_LOGIC;
			tt_eldegirisi: in STD_LOGIC;
			tt_toplam: out STD_LOGIC;
			tt_eldecikisi: out STD_LOGIC
			);
	end component;
	
	signal arakablo1 : STD_LOGIC;
	signal arakablo2 : STD_LOGIC;
	signal arakablo3 : STD_LOGIC;
	signal arakablo4 : STD_LOGIC;
	signal arakablo5 : STD_LOGIC;
	signal arakablo6 : STD_LOGIC;
	signal arakablo7 : STD_LOGIC;
begin
	blok1 : XOR_KAPISI port map(B(0),X,arakablo1);
	blok2 : XOR_KAPISI port map(B(1),X,arakablo2);
	blok3 : XOR_KAPISI port map(B(2),X,arakablo3);
	blok4 : XOR_KAPISI port map(B(3),X,arakablo4);
	blok5 : TT port map (A(0),arakablo1,X,S(0),arakablo5);
	blok6 : TT port map (A(1),arakablo2,arakablo5,S(1),arakablo6);
	blok7 : TT port map (A(2),arakablo3,arakablo6,S(2),arakablo7);
	blok8 : TT port map (A(3),arakablo4,arakablo7,S(3),S(4));

end Behavioral;

