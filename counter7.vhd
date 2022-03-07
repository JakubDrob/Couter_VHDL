library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Counter7 is
port(
	bcd_L: out std_logic_vector(3 downto 0);
	bcd_H: out std_logic_vector(3 downto 0);
	ck, rst, enable: in std_logic);
end;

architecture Simple of Counter7 is
begin

process(ck,rst)
variable v_bcdL: unsigned(3 downto 0);
variable v_bcdH: unsigned(3 downto 0);

begin
	if rst = '1' then 
		v_bcdL := "0000"; 
		v_bcdH := "0000";
	elsif rising_edge(ck) then
		if enable = '1' then
			if((v_bcdL=9) and (v_bcdH=9)) then
				v_bcdL:="0000";
				v_bcdH:="0000";
			elsif(v_bcdL=9) then
				v_bcdH:=v_bcdH+"0001";
				v_bcdL:="0000";
			else v_bcdL:=v_bcdL+"0001";		
			end if;
		end if;
	end if;
	bcd_L<=std_logic_vector(v_bcdL);
	bcd_H<=std_logic_vector(v_bcdH);

end process;


end Simple;

