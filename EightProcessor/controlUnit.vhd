----------------------------------------------------------------------------------
------------------------------------CONTROL-UNIT----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity controlUnit is
    port(
        CLR, CLK: IN STD_LOGIC;

        --input signals
        CNTCHK, Done, neq0: IN STD_LOGIC;


        --control signals
        nLoad, nShift, CNT, UPdown, RST, CNT8, OUTPUT: OUT STD_LOGIC
    );
end controlUnit;

--architecture
architecture Structural of controlUnit is
    type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8,ST9);
    signal PS, NS: state_type;
    signal controlSignal: STD_LOGIC_VECTOR(6 downto 0);

    
    
    


begin
	nLoad <= controlSignal(6);
    nShift <= controlSignal(5);
    CNT <= controlSignal(4);
    UPdown <= controlSignal(3);
    RST <= controlSignal(2);
    CNT8 <= controlSignal(1);
    OUTPUT <= controlSignal(0);

    sync_proc : process(CLK, NS, CLR)
    begin
        --async input
        if (CLR = '1') then
            PS <= ST0;
        elsif(RISING_EDGE(CLK)) then
            PS <= NS;            
        end if ;
        
    end process sync_proc; -- sync_proc


    comb_proc : process(PS, CNTCHK, Done, neq0, CLR)
    begin
        case(PS) is
            when ST0 =>
                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '1';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';

                    controlSignal <= "10----0";

                    if (CLR = '0') then
                        NS <= ST1;
                    else
                        NS <= ST0;
                    end if ;

            when ST1 =>
                    NS <= ST2;

                    -- RST <= '1';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';

                    controlSignal <= "000-100";

        
            when ST2 =>
                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';

                    controlSignal <= "-------";




                if (neq0 = '1' AND CNTCHK = '0') then
                    NS <= ST3;

                elsif (neq0 = '0' AND CNTCHK = '0') then
                    NS <= ST4;
                else
                    NS <= ST6;  --TEST!!!

                end if ;

            when ST3 =>
                
                    NS <= ST5;

                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '1';
                    -- UPdown <= '1';
                
                    controlSignal <= "0011000";


            when ST4 =>
                
                    NS <= ST5;

                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '1';
                    -- UPdown <= '0';
                
                    controlSignal <= "0010000";

            when ST5 =>
                
                    NS <= ST6;

                    -- RST <= '0';
                    -- nShift <= '1';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';
                    controlSignal <= "010-000";
            when ST6 =>
                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';
                    controlSignal <= "000-000";

                if (CNTCHK = '0') then
                    NS <= ST2;
                    controlSignal(1) <= '1';
                    
                -- elsif (CNTCHK = '1' AND Outputsig = '1') then
                --     NS <= ST7;
                      
                -- elsif (CNTCHK = '1' AND Outputsig = '0') then
                --     NS <= ST8;
                else
                    NS <= ST7;

                end if ;

            when ST7 =>
                    controlSignal <= "000-001";

                    if (Done = '1') then
                        NS <= ST7;
                    else
                        NS <= ST0; --Test to catch error
                            
                    end if ;

                    

                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '1';
                    -- CNT <= '0';
                    -- UPdown <= '0';
                    
            -- when ST8 =>
            --         NS <= ST9;

            --         -- RST <= '0';
            --         -- nShift <= '0';
            --         -- nLoad <= '0';
            --         -- CNT8 <= '0';
            --         -- OUTPUT <= '1';
            --         -- CNT <= '0';
            --         -- UPdown <= '0';

            --         controlSignal <= "000-001";
        
            -- when ST9 =>
            --         -- RST <= '0';
            --         -- nShift <= '0';
            --         -- nLoad <= '0';
            --         -- CNT8 <= '0';
            --         -- OUTPUT <= '0';
            --         -- CNT <= '0';
            --         -- UPdown <= '0';
            --         controlSignal <= "000-001";

            --     --if (Done = '1') then
            --         NS <= ST9;


            --     --else
            --        -- NS <= ST0; --TEST!!!  --TEST TO CATCH ERROR
            --     --end if ;

            when others =>
                    NS <= ST0;
						  
                    -- RST <= '0';
                    -- nShift <= '0';
                    -- nLoad <= '0';
                    -- CNT8 <= '0';
                    -- OUTPUT <= '0';
                    -- CNT <= '0';
                    -- UPdown <= '0';
                    controlSignal <= "-------";
                    --CLR <= '1';

        end case ;
        
    end process comb_proc; -- comb_proc



end Structural;


