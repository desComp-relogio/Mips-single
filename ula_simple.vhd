library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_4 is
	port (
    -- in
    A     : in STD_LOGIC_VECTOR (31 downto 0); 
    B     : in STD_LOGIC_VECTOR (31 downto 0);  
    C_IN  : in STD_LOGIC_VECTOR (31 downto 0);  
    
    -- out
    C_OUT : out STD_LOGIC;
		V     : out STD_LOGIC; 
		Q     : out STD_LOGIC_VECTOR (31 downto 0)
  );       
end entity;

architecture mux_4_arch of mux_4 is
begin
with SEL select
    X <= A when "00",
         B when "01",
         C when "10",
         D when "11",
         (others => '0') when others;
			
end architecture;