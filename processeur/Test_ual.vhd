--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:36 04/15/2021
-- Design Name:   
-- Module Name:   /home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/ual/Test_ual.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ual
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
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ual IS
END Test_ual;
 
ARCHITECTURE behavior OF Test_ual IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ual
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');
	signal CLK : std_logic;
 	--Outputs
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   signal S : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ual PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          N => N,
          O => O,
          Z => Z,
          C => C,
          S => S
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
			
			-- add
			A <= x"05";
			B <= x"03";
			Ctrl_Alu <= "001";
			wait for CLK_period*5;		
			
			-- mul
			A <= x"05";
			B <= x"04";
			Ctrl_Alu <= "010";
			wait for CLK_period*5;		
			
			-- sub
			A <= x"05";
			B <= x"03";
			Ctrl_Alu <= "011";
			wait for CLK_period*5;

			-- sub avec N == 1
			A <= x"03";
			B <= x"05";
			Ctrl_Alu <= "011";
			wait for CLK_period*5;
					
			
			-- O/C
			A <= x"FE";
			B <= x"FE";
			Ctrl_Alu <= "010";
			wait for CLK_period*5;			
			
			-- Z
			A <= x"05";
			B <= x"05";
			Ctrl_Alu <= "011";
			wait for CLK_period*5;
			
			
			

      wait;
   end process;

END;
