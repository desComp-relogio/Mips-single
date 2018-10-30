library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mipssingle is
	port (
    CLOCK_50 : in STD_LOGIC;
    KEY: in STD_LOGIC_VECTOR(3 DOWNTO 0);
    SW: in STD_LOGIC_VECTOR(17 DOWNTO 0);
	 
    LEDR  : out STD_LOGIC_VECTOR(17 DOWNTO 0) := (others => '0');
    LEDG  : out STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
	 
    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0)
  );

end entity;

architecture mipssingleArch of mipssingle is
    signal aux_inst_opcode      : STD_LOGIC_VECTOR(5 downto 0);
    signal aux_ula_op           : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 signal CLOCK					  : STD_LOGIC;

    signal aux_mux_pc_beq_jmp   : STD_LOGIC;
    signal aux_mux_rt_rd        : STD_LOGIC;
    signal aux_mux_rt_imm       : STD_LOGIC;
    signal aux_mux_ula_mem      : STD_LOGIC;

    signal aux_hab_escrita_reg  : STD_LOGIC;
    signal aux_hab_leitura_mem  : STD_LOGIC;
    signal aux_hab_escrita_mem  : STD_LOGIC;
    
    signal aux_beq              : STD_LOGIC;
    
    signal aux_end_mem          : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_data_mem_r       : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_data_mem_w       : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_habMEM           : STD_LOGIC;
    -- eae meu bacano é quarta feira ja?
begin 
	CLOCK <= not KEY(0);
    
    mipsUc      : entity work.mipsUc port map(
        INST_OPCODE => aux_inst_opcode,
        MUX_PC_BEQ_JMP => aux_mux_pc_beq_jmp, MUX_RT_RD => aux_mux_rt_rd,
        MUX_RT_IMM => aux_mux_rt_imm, MUX_ULA_MEM => aux_mux_ula_mem,
        HAB_ESCRITA_REG => aux_hab_escrita_reg,
        HAB_LEITURA_MEM => aux_hab_leitura_mem, HAB_ESCRITA_MEM => aux_hab_escrita_mem,
        BEQ => aux_beq
    );
        

    mipsFd      : entity work.mipsFd port map(
        CLK => CLOCK,
		  EN_BUT => not KEY(1), 
        MUX_PC_BEQ_JMP => aux_mux_pc_beq_jmp, MUX_RT_RD => aux_mux_rt_rd,
        MUX_RT_IMM => aux_mux_rt_imm, MUX_ULA_MEM => aux_mux_ula_mem,
        HAB_ESCRITA_REG => aux_hab_escrita_reg,
        HAB_LEITURA_MEM => aux_hab_leitura_mem, HAB_ESCRITA_MEM => aux_hab_escrita_mem,
        END_MEM => aux_end_mem, DATA_MEM_R => aux_data_mem_r, DATA_MEM_W => aux_data_mem_w,
        INST_OPCODE => aux_inst_opcode,
        ULA_OP => aux_ula_op,
        BEQ => aux_beq
    );

    decoder     : entity work.decoder port map(
        ENDERECO => aux_end_mem,
        habMEM   => aux_habMEM
    );

    memoria: entity work.memoriaAll port map(
        CLK      => CLOCK,
        RD      => aux_hab_leitura_mem,
        WR => aux_hab_escrita_mem,
        END_MEM => aux_end_mem,
        DATA_MEM_W   => aux_data_mem_w,
        DATA_MEM_R   => aux_data_mem_r
    ); 

    display0 : entity work.conversorHex7seg
    Port map (saida7seg => HEX0, dadoHex => aux_inst_opcode(3 downto 0));
	 
    display1 : entity work.conversorHex7seg
    Port map (saida7seg => HEX1, dadoHex => "00" & aux_ula_op);

    display2 : entity work.conversorHex7seg
    Port map (saida7seg => HEX2, dadoHex => "000" & aux_hab_leitura_mem);

    display3 : entity work.conversorHex7seg
    Port map (saida7seg => HEX3, dadoHex => "000" & aux_habMEM);

    -- display4 : entity work.conversorHex7seg
    -- Port map (saida7seg => HEX4, dadoHex => UH_out_aux);
    
    -- display5 : entity work.conversorHex7seg	
    -- Port map (saida7seg => HEX5, dadoHex => DH_out_aux);

    -- display6 : entity work.conversorHex7seg
    -- Port map (saida7seg => HEX6, dadoHex => "1111", apaga => '1');
    
    -- display7 : entity work.conversorHex7seg
    -- Port map (saida7seg => HEX7, dadoHex => SW(17) &  '0' & SW(17) & '0', apaga => not SW(17));
	 
    -- Chave: tristate
    -- LED: FLIP FLOP
end architecture;
