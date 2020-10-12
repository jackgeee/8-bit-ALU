library ieee;
use ieee.std_logic_1164.all;

entity BIT_ADDER_TB is
end BIT_ADDER_TB;

architecture TB of BIT_ADDER_TB is

   --the component we are testing is BIT_ADDER
   component BIT_ADDER is
   port( x1: in std_logic;
         x2: in std_logic;
         cin: in std_logic;
		 sum: out std_logic;
		 cout: out std_logic
        );
   end component;

   signal a1, a2, a3, sum, cout: std_logic;

   begin
      test_BIT_ADDER: BIT_ADDER port map (a1, a2, a3, sum, cout);

   process 
      begin
         --case1
         a1 <= '0';
         a2 <= '0';
         a3 <= '0';
         wait for 10 ns;
		 assert((sum = '0') and (cout ='0'))
		 report"report1";
         
         --case2
         a1 <= '0';
         a2 <= '0';
         a3 <= '1';
         wait for 10 ns;
		 assert((sum = '1') and (cout ='0'))
		 report"report2";

         --case3
         a1 <= '0';
         a2 <= '1';
         a3 <= '0';
         wait for 10 ns;
		 assert((sum = '1') and (cout ='0'))
		 report"report3";
         
         --case4
         a1 <= '0';
         a2 <= '1';
         a3 <= '1';
         wait for 10 ns;
		 assert((sum = '0') and (cout ='1'))
		 report"report4";

         --case5
         a1 <= '1';
         a2 <= '0';
         a3 <= '0';
         wait for 10 ns;
		 assert((sum = '1') and (cout ='0'))
		 report"case5";

         --case6
         a1 <= '1';
         a2 <= '0';
         a3 <= '1';
         wait for 10 ns;
		 assert((sum = '0') and (cout ='1'))
		 report"case6";

         --case7
         a1 <= '1';
         a2 <= '1';
         a3 <= '0';
         wait for 10 ns;
		 assert((sum = '0') and (cout ='1'))
		 report"case7";

         --case8
         a1 <= '1';
         a2 <= '1';
         a3 <= '1';
         wait for 10 ns;
		 assert((sum = '1') and (cout ='1'));
		 report"case8";

         wait;
   end process;
end TB;

configuration CFG_TB of BIT_ADDER_TB is 
   for TB
   end for;
end CFG_TB; --or, lower case is OK (end cfg_TB)
