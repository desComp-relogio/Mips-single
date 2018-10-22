library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ulinha is
	port (
		-- Input ports
		A	: in  std_logic_vector(31 downto 0);
		B	: in  std_logic_vector(31 downto 0);
		cin: in  std_logic;

		-- Output ports
		q	: out std_logic_vector(31 downto 0);
		Z	: out std_logic;
		overflow : out std_logic
	);
	
end ulinha;


architecture arch_ulinha of ulinha is
	signal cout:  std_logic_vector(31 downto 0);
	signal inter: std_logic_vector(31 downto 0);
	signal inter2: std_logic_vector(31 downto 0);
	signal inter3: std_logic_vector(31 downto 0);


begin
	inter <= a xor b; 
	
	inter2 <= (a and b);
	inter3(0) <= inter(0) and cin;
	inter3(31 downto 1) <= inter(31 downto 1) and cout (30 downto 0);
	cout <= inter2 xor inter3;
	
	q(0) <= inter(0) xor cin;
	q(31 downto 1) <= inter(31 downto 1) xor cout(30 downto 0);
	
	overflow <= cout(30) xor cout(31);

	Z <= not(q(0) or q (1) or q(2) or q(3) or q(4) or q (5) or q (6) or q(7) or q(8) or q(9) or q(10)
	      or q(11) or q(12) or q(13) or q(14) or q(15) or q(16) or q(17) or q(18) or q(19) or q(20) 
			or q(21) or q(22) or q(23) or q(24) or q(25) or q(26) or q(27) or q(28) or q(29) or q(30) or q(31)) ;	
	
end arch_ulinha;
