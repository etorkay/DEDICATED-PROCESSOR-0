----------------------------------------------------------------------------------
-------------------------------------DEDICATED PROCESSOR--------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity Processor is
	port(
			INPUT: IN STD_LOGIC_VECTOR( 7 downto 0);
			CLK, CLR: IN STD_LOGIC;
			OUTPUT: OUT STD_LOGIC
	);
end Processor;

architecture structural of Processor is
--internal signals
signal cuCount, cuCNT8, cunLoad, cunShift, cuOutput, cuRST, cuUPdown: STD_LOGIC;
signal dpneq0, dpDone, dpCNT8CHK, dpOUTPUT: STD_LOGIC;


--component declaration

	component controlUnit
		port(
			CLR, CLK: IN STD_LOGIC;

			--input signals
			CNTCHK, Done, neq0: IN STD_LOGIC;

			--control signals
			nLoad, nShift, CNT, UPdown, RST, CNT8, OUTPUT: OUT STD_LOGIC
		);
	end component;


	component datapath
		port(
			CLK, RST: IN STD_LOGIC;

			--input signals
			nLoad, nShift, CNT, UPdown, CNT8, OUTsig: IN STD_LOGIC;

			--output signals
			neq0, Done, CNT8CHK, OUTPUT: OUT STD_LOGIC;

			--input data
			nInput: IN STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	

begin

	CU: controlUnit port map(
		CLR => CLR,
		CLK => CLK,

		CNTCHK => dpCNT8CHK,

		Done => dpDone, 
		neq0 => dpneq0, 
		--Outputsig => dpOUTPUT,   --check this

		--output
		nLoad => cunLoad, 
		nShift => cunShift, 
		CNT => cuCount, 
		UPdown =>cuUPdown, 
		RST => cuRST, 
		CNT8 => cuCNT8, 
		OUTPUT => cuOutput
		
	);

	DP: datapath port map(

		CLK => CLK,
		
		RST => cuRST,

		nInput => INPUT,

		neq0 => dpneq0, 
		Done => dpDone, 
		CNT8CHK => dpCNT8CHK, 
		
		OUTPUT => dpOUTPUT,

	--input		
		nLoad  => cunLoad, 
		nShift => cunShift, 
		CNT  => cuCount, 
		UPdown => cuUPdown, 
		CNT8 => cuCNT8, 
		OUTsig => cuOutput
	);

	--processor output
	OUTPUT <= dpOutput;


end structural;


