----------------------------------------------------------------------------------
-----------------------------------COUNT TO EIGHT---------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--entity
entity count_to_8 is
    port(
        RST, CNT8, CLK: IN STD_LOGIC;
        Q: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end count_to_8;

--architecture
architecture Behavioral of count_to_8 is
signal tmpCount: STD_LOGIC_VECTOR(3 downto 0);
signal cntVal: INTEGER RANGE 0 to 15:= 0;	--tmp var for Counter (Made 8bits to subvert a limitation)

begin
    process(CLK,tmpCount)
    begin
        if (RISING_EDGE(CLK)) then

            if (RST = '1') then
                tmpCount <= "0000"; 	--reset updown counter
                
            elsif(CNT8 = '1') then

                cntVal <= cntVal + 1;
                tmpCount <= STD_LOGIC_VECTOR(to_unsigned(cntVal, 4));
                
            end if;

        end if ;
        Q <= tmpCount; --Increments on every clock cycle
    end process ;


end Behavioral;


