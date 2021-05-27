
-- VHDL Instantiation Created from source file ual.vhd -- 11:52:32 05/26/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ual
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		Ctrl_Alu : IN std_logic_vector(2 downto 0);          
		N : OUT std_logic;
		O : OUT std_logic;
		Z : OUT std_logic;
		C : OUT std_logic;
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_ual: ual PORT MAP(
		A => ,
		B => ,
		Ctrl_Alu => ,
		N => ,
		O => ,
		Z => ,
		C => ,
		S => 
	);


