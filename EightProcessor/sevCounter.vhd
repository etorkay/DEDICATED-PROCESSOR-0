----------------------------------------------------------------------------------
---------------------------------SEVEN SEGMENT COUNTER----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--entity
entity sevCounter is
	port(
        CLK: IN STD_LOGIC; 
        OutVal: OUT STD_LOGIC_VECTOR(1 downto 0)
	);
end sevCounter;

--architecture
architecture Structural of sevCounter is
    --internal signals
    signal intCount: INTEGER RANGE 0 to 3:= 0;
    signal tmpCount: STD_LOGIC_VECTOR(1 downto 0);

begin
    identifier : process(CLK, tmpCount)
    begin
        if (RISING_EDGE(CLK)) then
                intCount <= intCount + 1;
                tmpCount <= STD_LOGIC_VECTOR(to_unsigned(intCount, 2));


                if (intCount = 3) then
                    intCount <= 0;
                end if ;

        end if ;
        Outval <= tmpCount;
    end process ; -- identifier


end Structural;


