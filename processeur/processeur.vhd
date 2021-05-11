----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:08 05/06/2021 
-- Design Name: 
-- Module Name:    processeur - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity processeur is  
    Port ( CLK_PROC : in  STD_LOGIC;
           RST_PROC : in  STD_LOGIC;
			  
			  QA: out STD_LOGIC_VECTOR (7 downto 0);
			  QB: out STD_LOGIC_VECTOR (7 downto 0)
			  );
end processeur;

architecture Behavioral of processeur is

	
	 COMPONENT UAL
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
	 END COMPONENT;

    COMPONENT BancMemoData
    PORT(
         Addr : IN  std_logic_vector(7 downto 0);
         INPUT : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

	 COMPONENT BancRegistre
    Port ( AddrA : in  STD_LOGIC_VECTOR (3 downto 0);
           AddrB : in  STD_LOGIC_VECTOR (3 downto 0);
           AddrW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;

	 COMPONENT BancMemoInstruction
    PORT(
         Addr : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT pipeline
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
           C_in : in  STD_LOGIC_VECTOR (7 downto 0);
           A_out : out  STD_LOGIC_VECTOR (7 downto 0);
           B_out : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC_VECTOR (7 downto 0);
           OP_in : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
	END COMPONENT;

	---------------------SIGNAL--------------------------

	type pipe is record
		A : STD_LOGIC_VECTOR (7 downto 0);
	   B : STD_LOGIC_VECTOR (7 downto 0);
	   C : STD_LOGIC_VECTOR (7 downto 0);
	   OP : STD_LOGIC_VECTOR (7 downto 0);
	end record;
	
	--line
	signal LI_DI2DI_EX : pipe;
	signal DI_EX2EX_Mem : pipe;
	signal EX_Mem2Mem_RE : pipe;
	signal Mem_RE2Out : pipe;

	--MUX
	signal LI_DI_MUX_DI_EX : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal DI_EX_MUX_EX_Mem : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal EX_Mem_MUX_MemD_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal MemD_OUT_MUX_MEM_RE: STD_LOGIC_VECTOR(7 DOWNTO 0);	
	
	--LC
	signal DI_EX_LC_EX_MEM: STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal EX_MEM_LC_MEM_RE: std_logic;
	signal MEM_RE_LC_OUT: std_logic;
	
	--MemoInstruction
	signal INPUT_ADDR : STD_LOGIC_VECTOR (7 downto 0):=x"00";
	signal INSTR : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	--BancRegistre
	signal REG_QA : STD_LOGIC_VECTOR (7 downto 0);
	signal REG_QB : STD_LOGIC_VECTOR (7 downto 0);
	
	--UAL
	signal UAL_CTRL : STD_LOGIC_VECTOR(2 downto 0);
	signal UAL_N, UAL_O, UAL_Z, UAL_C : STD_LOGIC;
	signal UAL_S : STD_LOGIC_VECTOR (7 downto 0);
	--Mem Donnée out 
	signal MemD_OUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
begin

	QA<= REG_QA;
	QB<= REG_QB;
	--Memoire instruction
	Memoire_Instr : BancMemoInstruction PORT MAP (
		ADDR => INPUT_ADDR,
		CLK => CLK_PROC,
		OUTPUT => INSTR
	);
	
	--LI/DI
	
	LI_DI :  pipeline PORT MAP (
			CLK => CLK_PROC,
			A_in => INSTR(23 downto 16),
			B_in => INSTR(15 downto 8),
			C_in => INSTR(7 downto 0),
			OP_in => INSTR(31 downto 24),
			OP_out => LI_DI2DI_EX.OP,
			A_out => LI_DI2DI_EX.A,
			B_out => LI_DI2DI_EX.B,
			C_out => LI_DI2DI_EX.C
	);
	--Banc de registres 
	BancR : BancRegistre PORT MAP (
			AddrA => LI_DI2DI_EX.B(3 downto 0),
			AddrB => LI_DI2DI_EX.C(3 downto 0),			
			AddrW => Mem_RE2Out.A(3 downto 0),
			W => MEM_RE_LC_OUT,
			DATA => Mem_RE2Out.B,
			RST => RST_PROC,
			CLK=> CLK_PROC,
			QA => REG_QA,
			QB => REG_QB
	);
	 
	--DI/EX
	DI_EX :  pipeline PORT MAP (
		CLK => CLK_PROC,
		A_in => INSTR(23 downto 16),
		B_in => INSTR(15 downto 8),
		C_in => INSTR(7 downto 0),
		OP_in => INSTR(31 downto 24),
		OP_out => DI_EX2EX_Mem.OP,
		A_out => DI_EX2EX_Mem.A,
		B_out => DI_EX2EX_Mem.B,
		C_out => DI_EX2EX_Mem.C
	);
	--UAL
	UAL_MAP : UAL PORT MAP (
			A => DI_EX2EX_Mem.B,
			B => DI_EX2EX_Mem.C,
			Ctrl_Alu => DI_EX_LC_EX_MEM,
			N => UAL_N,
			O => UAL_O,
			Z => UAL_Z,
			C => UAL_C,
			S => UAL_S
	);
	 
	--EX/Mem
	EX_Mem : pipeline PORT MAP (
			CLK => CLK_PROC,
			A_in => DI_EX2EX_Mem.A,
			B_in => DI_EX_MUX_EX_MEM,
			C_in => DI_EX2EX_Mem.C,
			OP_in => DI_EX2EX_Mem.OP,
			OP_out =>  EX_Mem2Mem_RE.OP,
			A_out =>  EX_Mem2Mem_RE.A,
			B_out =>  EX_Mem2Mem_RE.B,
			C_out =>  EX_Mem2Mem_RE.C
	);
	--Memoire de donnees
	MemoData : BancMemoData PORT MAP (
		Addr => EX_Mem_MUX_MemD_IN ,
		INPUT =>EX_Mem2Mem_RE.B ,
		RW => EX_MEM_LC_MEM_RE ,
		RST => RST_PROC,
		CLK => CLK_PROC,
		OUTPUT => MemD_OUT 
	
	);
	--Mem/RE
	Mem_RE :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			A_in => EX_Mem2Mem_RE.A,
			B_in => MemD_OUT_MUX_MEM_RE,
			C_in => EX_Mem2Mem_RE.C,
			OP_in =>  EX_Mem2Mem_RE.OP,
			OP_out => Mem_RE2Out.OP,
			A_out => Mem_RE2Out.A,
			B_out => Mem_RE2Out.B,
			C_out => Mem_RE2Out.C
	);
	
--	--MUX
--	signal LI_DI_MUX_DI_EX : STD_LOGIC_VECTOR(7 DOWNTO 0);
--	signal DI_EX_MUX_EX_Mem : STD_LOGIC_VECTOR(7 DOWNTO 0);
--	signal EX_Mem_MUX_Mem_RE : STD_LOGIC_VECTOR(7 DOWNTO 0);
--	signal Mem_RE_MUX_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);	
--	
--	--LC
--	signal DI_EX_LC_EX_MEM: STD_LOGIC_VECTOR(2 DOWNTO 0);
--	signal EX_MEM_LC_MEM_RE: std_logic;
--	signal MEM_RE_LC_OUT: std_logic;
	
	--MUX 
	LI_DI_MUX_DI_EX <= LI_DI2DI_EX.B when LI_DI2DI_EX.OP = x"06"  --AFC
												or LI_DI2DI_EX.OP = x"07"  --LOAD
												else REG_QA;
	DI_EX_MUX_EX_MEM <= UAL_S when DI_EX2EX_MEM.OP = x"01"  --ADD
										or DI_EX2EX_MEM.OP = x"02"   --MUL
										or DI_EX2EX_MEM.OP = x"03"   --SOU
										else DI_EX2EX_MEM.B;
	--store --a
	EX_Mem_MUX_MemD_IN <= EX_MEM2MEM_RE.A when EX_MEM2MEM_RE.OP = x"08" --STORE 
														else EX_MEM2MEM_RE.B;
	MemD_OUT_MUX_MEM_RE <= MemD_OUT when EX_MEM2MEM_RE.OP = x"07"  --LOAD
												else EX_MEM2MEM_RE.B;
	
	--LC
	DI_EX_LC_EX_MEM <= DI_EX2EX_MEM.OP(2 DOWNTO 0);
	--ecriture dans memD
	EX_MEM_LC_MEM_RE <= '1' when EX_MEM2MEM_RE.OP = x"08" --STORE
									else '0';
	--ecriture ds bdr
	MEM_RE_LC_OUT  <= '1' when Mem_RE2Out.OP = x"06"  --AFC
										or  Mem_RE2Out.OP = x"05"  --COP
										or Mem_RE2Out.OP = x"07"	--LOAD
										or Mem_RE2Out.OP=x"01"  --ADD
										or Mem_RE2Out.OP=x"02"  --MUL
										or Mem_RE2Out.OP=x"03"  --SOU
								else '0';

	
	process
	begin
		wait until CLK_PROC'event and CLK_PROC='1';
			INPUT_ADDR<=INPUT_ADDR+x"01";

	end process;	
end Behavioral;

