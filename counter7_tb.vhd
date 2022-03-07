LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT Counter7
	PORT(
		ck : IN std_logic;
		rst : IN std_logic;
		enable : IN std_logic;          
		bcd_L : OUT std_logic_vector(3 downto 0);
		bcd_H : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL bcd_L :  std_logic_vector(3 downto 0);
	SIGNAL bcd_H :  std_logic_vector(3 downto 0);
	SIGNAL ck :  std_logic;
	SIGNAL rst :  std_logic;
	SIGNAL enable :  std_logic;

BEGIN

	uut: Counter7 PORT MAP(
		bcd_L => bcd_L,
		bcd_H => bcd_H,
		ck => ck,
		rst => rst,
		enable => enable
	);



-- *** Test Bench - User Defined Section ***
   clock : PROCESS
   BEGIN
	ck<='0';
	for i in 0 to 2000 loop
		wait for 10ns;
		ck<= not ck;
	end loop;
      wait; -- will wait forever
   END PROCESS;


   reset : PROCESS
   BEGIN
	rst<= '1';
	wait for 50 ns;
	wait until ck='0';
	rst<='0';
      wait; -- will wait forever
   END PROCESS;


   tb : PROCESS
   BEGIN
	enable <= '0';
	wait for 200ns;
	wait until ck='0';
	enable<='1';
	wait for 2500ns;
	wait until ck='0';
	enable<='0';
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***
END;

