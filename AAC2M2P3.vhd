library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture state of FSM is
	type state_type is (A,B,C);
	signal state:state_type;
		begin
			proc:process(IN1,RST,CLK)
				begin
					if rising_edge(CLK) then
						if rst='1' then state<=A;
       						else 
							case state is	
								when A =>
									if In1='1' then state<=b;
									else state<=a;
									end if;
								when B =>
									if In1='1' then state<=b;
									else state<=c;
									end if;
								when C =>
									if In1='1' then state<=a;
									else state<=c;
									end if;
							 	when others =>
									state <= A;
							end case;
						end if;
					end if;
				end process proc;
		Out1<= '1' when state=c else '0';
	end architecture state;
									
