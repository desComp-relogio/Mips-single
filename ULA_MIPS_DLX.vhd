library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_misc.nor_reduce;

entity ULA_MIPS_DLX is
	port (
      -- Input ports
		A	: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		B	: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEL: in STD_LOGIC_VECTOR(1 DOWNTO 0);
		INVERTE_A : in STD_LOGIC;
		INVERTE_B : in STD_LOGIC;
    C_OUT : in STD_LOGIC;
		C_IN 	: in STD_LOGIC;
		
      -- Output ports
    Q 		: out STD_LOGIC_VECTOR(31 DOWNTO 0);
		ZERO	: out STD_LOGIC
	);
end entity;


architecture ULA_MIPS_DLX_Arch of ULA_MIPS_DLX is
	-- Declarations (optional)
  signal auxA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal auxB : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal auxULAinA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal auxULAinB : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal auxResult : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  begin
    MUX2A: entity work.mux_2 PORT MAP (A => auxA, B => not auxA, sel => INVERTE_A, q => auxULAinA);
    MUX2B: entity work.mux_2 PORT MAP (A => auxB, B => not auxB, sel => INVERTE_B, q => auxULAinB);
--    MUX4 : entity work.mux_4 PORT MAP (A => auxULAinB and auxULAinA, B => auxULAinA or auxULAinB, C => ?, D => ?, X => auxResult);
    
    auxA <= A;
    auxB <= B;
    Q <= auxResult;
    ZERO <= nor_reduce(auxResult);

end architecture;