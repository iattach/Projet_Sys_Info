----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:39 05/04/2021 
-- Design Name: 
-- Module Name:    BancMemoData - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BancMemoData is
    Port ( Addr : in  STD_LOGIC_VECTOR (7 downto 0);
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end BancMemoData;

architecture Behavioral of BancMemoData is

	type table is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal Data: table ;

begin

	process
	begin
		wait until CLK'event and CLK='1';
			if(RST='0') then 
				Data<=(others => X"00");
			else 
				if (RW ='1') then  --write
					Data(to_integer(unsigned(Addr)))<= INPUT;
				--else --read
					--OUTPUT <= Data(to_integer(unsigned(Addr)));
				end if;
			end if;
	end process;
	OUTPUT <= Data(to_integer(unsigned(Addr)));

end Behavioral;

