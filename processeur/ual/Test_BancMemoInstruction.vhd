--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:57:10 05/04/2021
-- Design Name:   
-- Module Name:   /home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/ual/Test_BancMemoInstruction.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BancMemoInstruction
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
Use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Test_BancMemoInstruction IS
END Test_BancMemoInstruction;
 
ARCHITECTURE behavior OF Test_BancMemoInstruction IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BancMemoInstruction
    PORT(
         Addr : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Addr : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BancMemoInstruction PORT MAP (
          Addr => Addr,
          CLK => CLK,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
		if RST = '0' then
			ADDR <= x"00";
		else
			ADDR<= ADDR + 1;
		end if;
   end process;
 

-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	
		RST<='0';

      wait for CLK_period*2;
		RST<='1';

      -- insert stimulus here 
--		wait for CLK_period*3;
--		
--		wait for CLK_period*3;
--		for i in 0 to 15 loop
--			ADDR<= ADDR + x"1";
--		end loop;
      wait;
   end process;END;
