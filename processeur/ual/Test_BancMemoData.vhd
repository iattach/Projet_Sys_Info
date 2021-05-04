--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:56:19 05/04/2021
-- Design Name:   
-- Module Name:   /home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/ual/Test_BancMemoData.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BancMemoData
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Test_BancMemoData IS
END Test_BancMemoData;
 
ARCHITECTURE behavior OF Test_BancMemoData IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal Addr : std_logic_vector(7 downto 0) := (others => '0');
   signal INPUT : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BancMemoData PORT MAP (
          Addr => Addr,
          INPUT => INPUT,
          RW => RW,
          RST => RST,
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
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
				RST <= '1';

		addr <= x"01";
		INPUT <= x"0A";
		RW <= '0';
      wait for CLK_period*5;

		addr <= x"01";
		INPUT <= x"0A";
		RW <= '1';
      wait for CLK_period*5;

		RST <= '0';
      wait for CLK_period*5;
		RST <= '1';

		
      wait;
   end process;

END;
