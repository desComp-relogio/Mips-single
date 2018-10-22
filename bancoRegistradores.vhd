library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bancoRegistradores is
      port (end1 : in    std_logic_vector(4 downto 0);
				end2 : in    std_logic_vector(4 downto 0);
				end3 : in    std_logic_vector(4 downto 0);
				dadoe3 : in    std_logic_vector(31 downto 0);
				
           dadol1 : out   std_logic_vector(31 downto 0);
			  dadol2 : out   std_logic_vector(31 downto 0);
           escrita : in  std_logic
			  );
 end entity;
 
 architecture comportamento of bancoRegistradores is
 begin

 end comportamento;
 