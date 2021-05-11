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

type table is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
signal instruction: table ;

begin
   instruction <= (0 => x"010A050A", 
						 1 => x"020A050A",
						 2 => x"030A050A",
						 3 => x"050A050A",
						 4 => x"060A050A",
						 5 => x"070A050A",
						 6 => x"080A050A",
						 others => x"00000000");
process
	begin
		wait until CLK'event and CLK='1';
			OUTPUT<= instruction(to_integer(unsigned(Addr)));
	end process;
end Behavioral;

