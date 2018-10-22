library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Demux_32 is

	port
	(
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
		
		sel : in  std_logic_vector(4 downto 0);

		-- Output ports
		q : out  std_logic
	);
	
end Mux_4;

architecture arch_demux_32 of Demux_32 is
	
begin
		
	q <= 
		D01 when sel = "00000" else
		D02 when sel = "00001" else
		D03 when sel = "00010" else
		D04 when sel = "00011" else
		D05 when sel = "00100" else
		D06 when sel = "00101" else
		D07 when sel = "00110" else
		D08 when sel = "00111" else
		D09 when sel = "01000" else
		D10 when sel = "01001" else
		D11 when sel = "01010" else
		D12 when sel = "01011" else
		D13 when sel = "01100" else
		D14 when sel = "01101" else
		D15 when sel = "01110" else
		D16 when sel = "01111" else
		D17 when sel = "10000" else
		D18 when sel = "10001" else
		D19 when sel = "10010" else
		D20 when sel = "10011" else
		D21 when sel = "10100" else
		D22 when sel = "10101" else
		D23 when sel = "10110" else
		D24 when sel = "10111" else
		D25 when sel = "11000" else
		D26 when sel = "11001" else
		D27 when sel = "11010" else
		D28 when sel = "11011" else
		D29 when sel = "11100" else
		D30 when sel = "11101" else
		D31 when sel = "11110" else
		D32 when sel = "11111";

end arch_demux_32;
