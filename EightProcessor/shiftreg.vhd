----------------------------------------------------------------------------------
------------------------------SHIFT FLIPFLOP MODEL--------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--entity
entity shiftreg is
	PORT(
		CLK: IN STD_LOGIC;
		--Signal enable
		Shift, Load: IN STD_LOGIC;
		
		--Data Input/Output
		D: IN STD_LOGIC_VECTOR(7 downto 0);
		Q: OUT STD_LOGIC_VECTOR(7 downto 0)
		
		
	);
end shiftreg;

architecture Structural of shiftreg is
	signal tmp: STD_LOGIC_VECTOR(7 downto 0);

begin
	--tmp <= D;
	shiftregs: process(CLK, tmp) is
		begin
			if(RISING_EDGE(CLK)) then
					if(Load = '1') then
						tmp <= D;						--vanilla D flip flop
					elsif(Shift = '1') then
						tmp <= '0' & tmp (7 downto 1);	--rightshift
					else
						tmp <= tmp;
					end if;
			end if;
				Q <= tmp;
		end process shiftregs;

end Structural;


