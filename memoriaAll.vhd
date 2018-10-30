library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaAll is
    port (
        CLK             : in STD_LOGIC;
        END_MEM         : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        DATA_MEM_W      : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        RD              : in STD_LOGIC;
        WR              : in STD_LOGIC;

        DATA_MEM_R      : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end entity;

architecture memoriaAllArch of memoriaAll is
    signal HM: std_logic;
begin
    decoder: entity work.decoder port map(ENDERECO => END_MEM, habMEM => HM);
    memoria64k: entity work.memoriaDeDados port map(CLK => CLK, LER => RD, ESCREVER => WR,
        ENDERECO => END_MEM(15 downto 2), DADO_W => DATA_MEM_W, DADO_R => DATA_MEM_R);
end architecture;