----------------------------------------------------------------------------------
---------------------------------------SEV DISPLAY--------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity sevDisplay is
	port(
        INPUT: IN STD_LOGIC;
        OUTPUT: OUT STD_LOGIC_VECTOR(15 downto 0)
    );
end sevDisplay;

architecture Behavioral of sevDisplay is

begin
			with INPUT select OUTPUT <= "0000000001000101" when '0',
										"0000000100100011" when '1',
										"0000000000000000" when others; 
                                     
                                      


end Behavioral;


