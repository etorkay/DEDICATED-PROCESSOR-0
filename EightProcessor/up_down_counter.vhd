----------------------------------------------------------------------------------
---------------------------------------UP/DOWN------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--entity
entity up_down_counter is
    port(
        UPdown, RST, CNT, CLK: IN STD_LOGIC;
        Q: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
	
end up_down_counter;

--entity
architecture Behavioral of up_down_counter is
signal tmpCount: STD_LOGIC_VECTOR(3 downto 0);
signal cntVal: INTEGER RANGE -8 to 8:= 0;	--tmp var for Counter (Made 8bits to subvert a limitation)
begin
    
    process(CLK, tmpCount)
    begin
        if (RISING_EDGE(CLK)) then

            if (RST = '1') then
                tmpCount <= "0000"; 	--reset updown counter
					 cntVal <= 0;

            elsif(UPdown = '1' AND CNT = '1') then
                cntVal <= cntVal + 1;
                tmpCount <= STD_LOGIC_VECTOR(to_unsigned(cntVal, 4));
            elsif (UPdown = '0' AND CNT = '1') then
                cntVal <= cntVal - 1;
                tmpCount <= STD_LOGIC_VECTOR(to_unsigned(cntVal, 4));
            end if;

        end if ;
        Q <= tmpCount; --Increments on every clock cycle
    end process ;

end Behavioral;


