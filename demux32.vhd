library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux32 is

	port (
		-- Input ports
		D01: in  std_logic;
		D02: in  std_logic;
		D03: in  std_logic;
		D04: in  std_logic;
		D05: in  std_logic;
		D06: in  std_logic;
		D07: in  std_logic;
		D08: in  std_logic;
		D09: in  std_logic;
		D10: in  std_logic;
		D11: in  std_logic;
		D12: in  std_logic;
		D13: in  std_logic;
		D14: in  std_logic;
		D15: in  std_logic;
		D16: in  std_logic;
		D17: in  std_logic;
		D18: in  std_logic;
		D19: in  std_logic;
		D20: in  std_logic;
		D21: in  std_logic;
		D22: in  std_logic;
		D23: in  std_logic;
		D24: in  std_logic;
		D25: in  std_logic;
		D26: in  std_logic;
		D27: in  std_logic;
		D28: in  std_logic;
		D29: in  std_logic;
		D30: in  std_logic;
		D31: in  std_logic;
		D32: in  std_logic;
		
		SEL : in std_logic_vector(4 downto 0);

		-- Output ports
		Q : out std_logic
	);
	
end demux32;

