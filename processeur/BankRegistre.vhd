----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:18:22 05/04/2021 
-- Design Name: 
-- Module Name:    BancRegistre - Behavioral 
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

entity BancRegistre is
    Port ( AddrA : in  STD_LOGIC_VECTOR (3 downto 0);
           AddrB : in  STD_LOGIC_VECTOR (3 downto 0);
           AddrW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end BancRegistre;

architecture Behavioral of BancRegistre is

type table is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
signal BR: table ;

begin

process
	begin
		wait until CLK'event and CLK='1';
			if(RST='0') then 
				BR<=(others => X"00");
			else 
				if (W='1') then --ecriture
					BR(conv_integer(AddrW))<= DATA;
				end if;
			end if;
	end process;
	QA <= DATA when (W='1' and AddrW=AddrA) else 
			BR(conv_integer(AddrA));
	QB <= DATA when (W='1' and AddrW=AddrB) else 
			BR(conv_integer(AddrB));
end Behavioral;

