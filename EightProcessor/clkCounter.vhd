----------------------------------------------------------------------------------
-----------------------------------CLK COUNTER------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity clkCounter is
    port(
        CLK: IN STD_LOGIC;
        CLKOUT, DEBOUNCE: OUT STD_LOGIC
    );
end clkCounter;

architecture Behavioral of clkCounter is
    signal intCount: INTEGER := 0;
    signal tmpCount: STD_LOGIC_VECTOR(18 downto 0); --pick bit 18

begin
    clkcounter : process(CLK, tmpCount)
    begin
        if (RISING_EDGE(CLK)) then
            intCount <= intCount + 1;
            tmpCount <= STD_LOGIC_VECTOR(to_unsigned(intCount, 19));

            if (tmpCount = "1111111111111111111" ) then
                intCount <= 0;                
            end if ;
            
        end if ;
        CLKOUT <= tmpCount(17);
		  DEBOUNCE <= tmpCount(18);
    end process ; -- clkcounter

end Behavioral;


