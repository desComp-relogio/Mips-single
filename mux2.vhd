-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;

-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;

entity mux2 is
	port (
		-- Input ports
		A		: in  std_logic_vector(31 downto 0);
		B		: in  std_logic_vector(31 downto 0);
		SEL	: in  std_logic;
		-- Output ports
		Q		: out std_logic_vector(31 downto 0)
	);
	
end entity;
architecture mux2Arch of mux2 is
	-- Declarations (optional)
begin
	process(SEL, A, B)
	begin
		 case SEL is
			  when '0' => Q <= A;
			  when '1' => Q <= B;
		 end case;
	end process;
end architecture;
