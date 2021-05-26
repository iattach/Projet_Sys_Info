----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:39 05/04/2021 
-- Design Name: 
-- Module Name:    BancMemoInstruction - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BancMemoInstruction is
    Port ( Addr : in  STD_LOGIC_VECTOR (7 downto 0);
			  WAITING : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
end BancMemoInstruction;

architecture Behavioral of BancMemoInstruction is

type table is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
signal instruction: table ;

begin
   instruction <= (
						 0 => x"06010A00", --AFC 1 10
						 5 => x"05000100", --COP 0 1
						 6 => x"08020500", --STR 2 5
						 7 => x"07010200", --LOAD 1 2
						 12 => x"01010001", --ADD 1 0 1
						 17 => x"02000100", --MUL 0 1 0
						 22 => x"03000001", --SUB 0 0 1
						 others => "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
										 
process
	begin
		wait until CLK'event and CLK='1';
		if WAITING = '1' and false then
			OUTPUT<= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
		else
		   OUTPUT<= instruction(to_integer(unsigned(Addr)));
		end if;
	end process;
end Behavioral;

