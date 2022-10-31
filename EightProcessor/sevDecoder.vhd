----------------------------------------------------------------------------------
-------------------------SEVEN SEGMENT DECODER------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


--entity
entity sevDecoder is
    port(
        INPUT: IN STD_LOGIC_VECTOR(3 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end sevDecoder;


--MSB mapped to a to i, active low

--architecture
architecture structural of sevDecoder is

begin
        with INPUT select OUTPUT <= "11111110" when "0000",
                                    "10001001" when "0001",
                                    "01100001" when "0010",
                                    "01001001" when "0011",
                                    "11010101" when "0100",
                                    "11000101" when "0101",
                                    "11111110" when others;       

end structural;


