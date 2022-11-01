----------------------------------------------------------------------------------
------------------------------------DATAPTH---------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity datapath is
    port(
        CLK, RST: IN STD_LOGIC;

        --input signals
        nLoad, nShift, CNT, UPdown, CNT8, OUTsig: IN STD_LOGIC;

        --output signals
        neq0, Done, CNT8CHK, OUTPUT: OUT STD_LOGIC;

        --input data
        nInput: IN STD_LOGIC_VECTOR(7 downto 0)
    );
end datapath;

--architecture
architecture structural of datapath is
    --internal signal 
    signal Q_cnt_8, Q_up_down: STD_LOGIC_VECTOR(3 downto 0);
    signal Q_input: STD_LOGIC_VECTOR(7 downto 0);
	 signal tmpOutput: STD_LOGIC;	--to be implemented

    --component declarations
    component shiftreg is
        port(
            CLK: IN STD_LOGIC;
            --Signal enable
            Shift, Load: IN STD_LOGIC;
            
            --Data Input/Output
            D: IN STD_LOGIC_VECTOR(7 downto 0);
            Q: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component up_down_counter is 
        port(
            UPdown, RST, CNT, CLK: IN STD_LOGIC;
            Q: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component count_to_8 is 
        port(
            RST, CNT8, CLK: IN STD_LOGIC;
            Q: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin

    C1: count_to_8 port map(
        RST => RST,
        CNT8 => CNT8,
        CLK => CLK,
        Q => Q_cnt_8
    );

    C2: up_down_counter port map(
        UPdown => UPdown,
        RST => RST,
        CNT => CNT,
        CLK => CLK,
        Q => Q_up_down

    );

    N1: shiftreg port map(
        CLK =>   CLK,
        Shift => nShift,
        Load => nLoad,
        D =>    nInput,
        Q =>  Q_input
    );
	

    --comparing 0th bit to 1
    neq0 <= Q_input(0);
	 
	--Assert 1 when Q_cnt_8 == 8
    CNT8CHK <= '1' when Q_cnt_8 = "1000" else '0';
    
    --NORing CountBit
    OUTPUT <= not(Q_up_down(3) OR Q_up_down(2) OR Q_up_down(1) OR Q_up_down(0)) when OUTsig = '1' else 'X'; --asserting uninitialized when 0
    Done <= '1' when OUTsig = '1' else '0';

end structural;







    -- process(CLK, OUTsig)
    -- begin
    --     if (RISING_EDGE(CLK)) then

    --         --NORing CountBit
    --         if (OUTsig = '1') then
    --             OUTPUT <= Q_up_down(3) OR Q_up_down(2) OR Q_up_down(1) OR Q_up_down(0);
    --             Done <= '1';
    --         end if ; 
            
    --         --Check if 8
    --         -- if (Q_cnt_8 = "1000") then
    --         --     CNT8CHK <= '1';
    --         -- end if ;
            
    --     end if ;
 
    -- end process ;

