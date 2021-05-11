--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:52:12 05/06/2021
-- Design Name:   
-- Module Name:   /home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/ual/TestProc.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processeur
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY TestProc IS
END TestProc;
 
ARCHITECTURE behavior OF TestProc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processeur
    PORT(
         CLK_PROC : IN  std_logic;
         RST_PROC : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_PROC : std_logic := '0';
   signal RST_PROC : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_PROC_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processeur PORT MAP (
          CLK_PROC => CLK_PROC,
          RST_PROC => RST_PROC,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_PROC_process :process
   begin
		CLK_PROC <= '0';
		wait for CLK_PROC_period/2;
		CLK_PROC <= '1';
		wait for CLK_PROC_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_PROC_period*2;

	-- insert stimulus here 
--		QA;
--		QB;
--		RST_PROC <= '1';
--		addr <= x"01";
--		INPUT <= x"0A";
--		
--		RW <= '0';
--      wait for CLK_period*5;
			
      wait;
   end process;

END;
