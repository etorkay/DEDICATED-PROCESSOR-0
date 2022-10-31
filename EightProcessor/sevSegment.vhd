----------------------------------------------------------------------------------
------------------------------SEVEN SEGMENT--------------------------------------- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity sevSegment is
    port(
		  --ouput 
        SEGMENTS: OUT STD_LOGIC_VECTOR(7 downto 0);
        SEGsel: OUT STD_LOGIC_VECTOR(3 downto 0);
		  DEBOUNCECLK: OUT STD_LOGIC;
		
		  --input
		  INPUT: IN STD_LOGIC;	
        CLK: IN STD_LOGIC
    );
end sevSegment;

--architecture
architecture Structural of sevSegment is
    --internal signals
    signal count: STD_LOGIC_VECTOR(1 downto 0);
    signal muxOut: STD_LOGIC_VECTOR(3 downto 0);
    signal display: STD_LOGIC_VECTOR(15 downto 0);
    signal custCLK: STD_LOGIC;

    --component declaration
    component sevCounter
        port(
            CLK: IN STD_LOGIC; 
            OutVal: OUT STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component sevMux
    port(
        INPUT: IN STD_LOGIC_VECTOR(15 downto 0);
        muxSel: IN STD_LOGIC_VECTOR(1 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component anoDecoder
        port(
            ANI: IN STD_LOGIC_VECTOR(1 downto 0);
            ANOUT: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
	 
	 component sevDisplay
			port(
			  INPUT: IN STD_LOGIC;
			  OUTPUT: OUT STD_LOGIC_VECTOR(15 downto 0)
		 );
	 end component;

    component sevDecoder
        port(
            INPUT: IN STD_LOGIC_VECTOR(3 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	 
	 component clkCounter
		port(
            CLK: IN STD_LOGIC;
            CLKOUT: OUT STD_LOGIC
        );
	 end component;
	 

begin
    CCLK1: clkCounter port map(
        CLK => CLK,
        CLKOUT => custCLK
    );

    CNT1: sevCounter port map(
        CLK => custCLK,
        OutVal => count
    );

    MUX1: sevMux port map(
        INPUT => display,	--hardcoded
        muxSel => count,
        OUTPUT => muxOut
    );


    DEC1: sevDecoder port map(
        INPUT => muxOut,
        OUTPUT => SEGMENTS
    );

    DEC2: anoDecoder port map(
        ANI => count,
        ANOUT => SEGsel
    );
	 
	 DEC3: sevDisplay port map(
		  INPUT => INPUT,
		  OUTPUT => display
	 );


end Structural;


