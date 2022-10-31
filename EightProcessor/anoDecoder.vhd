----------------------------------------------------------------------------------
-------------------------------------ANODE DECODER--------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--active low

--entity
entity anoDecoder is
    port(
        ANI: IN STD_LOGIC_VECTOR(1 downto 0);
        ANOUT: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end anoDecoder;

--architecture
architecture Structural of anoDecoder is

begin
    with ANI select ANOUT <= "0111" when "11",
                             "1011" when "10",
                             "1101" when "01",
                             "1110" when "00",
									  "ZZZZ" when others;




end Structural;


