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
           CLK : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
end BancMemoInstruction;

architecture Behavioral of BancMemoInstruction is

type table is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
signal instruction: table ;

begin
   instruction <= (0 => x"00000000", 1 => x"05060104", others => x"00000000");
process
	begin
		wait until CLK'event and CLK='1';
			OUTPUT<= instruction(to_integer(unsigned(Addr)));
	end process;
end Behavioral;

