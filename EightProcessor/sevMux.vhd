----------------------------------------------------------------------------------
----------------------------------SEVEN SEG INPUT MUX-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity sevMux is
    port(
            INPUT: IN STD_LOGIC_VECTOR(15 downto 0);
            muxSel: IN STD_LOGIC_VECTOR(1 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end sevMux;

--architecture
architecture Structural of sevMux is

begin
    with muxSel select OUTPUT <= INPUT(3 downto 0)  when "00",
                                 INPUT(7 downto 4)  when "01",
                                 INPUT(11 downto 8) when "10",
                                 INPUT(15 downto 12) when "11",
											"ZZZZ" when others;

end Structural;


