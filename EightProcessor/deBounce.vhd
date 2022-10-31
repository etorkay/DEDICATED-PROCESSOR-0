----------------------------------------------------------------------------------
------------------------------------BUTTON DEBOUNCER------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity deBounce is
	port(
		CLK, INPUT: IN STD_LOGIC;
		OUTPUT: OUT STD_LOGIC
	);
end deBounce;

--architecture
architecture Behavioral of deBounce is
	signal tmpD: STD_LOGIC; 

begin

	ButtonDebounce : process(CLK)
	begin
		if (RISING_EDGE(CLK)) then
			tmpD <= INPUT;

		else
			tmpD <= tmpD;

		end if ;
		OUTPUT <= tmpD;
	end process ; -- ButtonDebounce



end Behavioral;


