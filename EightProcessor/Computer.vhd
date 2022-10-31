----------------------------------------------------------------------------------
---------------------------------------COMPUTER-----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity Computer is
	port(
		INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
		CLK,CLR: IN STD_LOGIC;
		
		--display signals
		SEGMENTS: OUT STD_LOGIC_VECTOR(7 downto 0);
		SEGsel: OUT STD_LOGIC_VECTOR(3 downto 0)
	);
end Computer;

architecture Structural of Computer is
--internal signal
	signal inputoutput, debounceSig: STD_LOGIC;

--compnent declaration
	component Processor
			port(
				INPUT: IN STD_LOGIC_VECTOR( 7 downto 0);
				CLK, CLR: IN STD_LOGIC;
				OUTPUT: OUT STD_LOGIC
		);
	end component;
	
	component sevSegment
			port(
			  SEGMENTS: OUT STD_LOGIC_VECTOR(7 downto 0);
			  SEGsel: OUT STD_LOGIC_VECTOR(3 downto 0);
			  INPUT: IN STD_LOGIC;	
			  CLK: IN STD_LOGIC
		 );
	end component;
	
	component deBounce
		port(
			  CLK, INPUT: IN STD_LOGIC;
		     OUTPUT: OUT STD_LOGIC
		);
	end component;

begin
	DISP: sevSegment port map(
			SEGMENTS => SEGMENTS,
			 SEGsel => SEGsel,
			 INPUT => inputoutput,	
			 CLK => CLK
	);
	
	PU: Processor port map(
			INPUT => INPUT,
			CLK => CLK, 
			CLR =>  debounceSig, --connect to clr '0',
			OUTPUT => inputoutput
	);
	
	DBNT: deBounce port map(
			CLK => CLK,
			INPUT => CLR,
		   OUTPUT => debounceSig
	);

end Structural;


