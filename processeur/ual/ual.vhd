----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:36 04/15/2021 
-- Design Name: 
-- Module Name:    ual - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ual;

architecture Behavioral of ual is
	--signal ALU_Resultat : std_logic_vector (7 downto 0);
	signal radd : std_logic_vector (8 downto 0);
	signal rsub : std_logic_vector (8 downto 0);
	signal rmul : std_logic_vector (15 downto 0);
	signal Stmp : std_logic_vector (7 downto 0);

begin
	
	radd <= ('0'& A) + ('0'& B);
	rsub <= ('0'& A) - ('0'& B);
	rmul <= A * B;
	Stmp <= radd (7 downto 0) when CTRL_ALU="001" else --ADD 0x01
			  rsub (7 downto 0) when CTRL_ALU="010" else --SUB 0x02
			  rmul (7 downto 0) when CTRL_ALU="011" else --MUL 0x03
			  x"00";    --DIV
			  
	N <= Stmp(7);--poid fort de Stmp
	C <= radd(8); --la retenue de l'add
	O <= '0' when rmul(15 downto 8) = "00000000" else '1';
	Z <= '1' when Stmp(7 downto 0) = "00000000" else '0';
	S <= Stmp;
	
end Behavioral;

