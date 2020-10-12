library ieee;
use ieee.std_logic_1164.all;
entity ALU_1bit_TB is
end ALU_1bit_TB;
architecture TB of ALU_1bit_TB is
  
   component ALU_1bit is
   port(  op: in std_logic_vector(1 downto 0);
	  a: in std_logic;
      b: in std_logic;
	  binv: in std_logic;
	  cin: in std_logic;
      cout: out std_logic;
	  result: out std_logic
        );
   end component;
   signal a, b, cin, binv, cout, result: std_logic;
   signal op:  std_logic_vector(1 downto 0);
   begin
      test_ALU: ALU_1bit port map (op, a, b, binv, cin, cout, result);
   process 
      begin
         --case1
         op <= "00";
		 a <= '0';
         b<= '0';
		 binv<= '1';
         cin<= '0';
		
         wait for 10 ns;
         
         --case2
         op <= "00";
         a <= '0';
         b <= '0';
		 binv<= '1';
		 cin <= '1';
		 
         wait for 10 ns;
         --case3
         op <= "00";
         a <= '0';
		 b <= '1';
		 binv<= '0';
		 cin <= '0';
		 
      
		 
         wait for 10 ns;
         
         --case4
        op <= "00";
        a <= '0';
         b <= '1';
		 binv<= '0';
         cin <= '1';
		 
		
         wait for 10 ns;
         --case5
        op <= "00";
        a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '0';
		 
		 
         wait for 10 ns;
         --case6
        op <= "00";
        a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '1';
		 
		
         wait for 10 ns;
         --case7
        op <= "00";
        a <= '1';
         b <= '1';
		 binv<= '0';
         cin <= '0';
		 
		
         wait for 10 ns;
         --case8
        op <= "00";
        a <= '1';
        b  <= '1';
		  binv<= '0';
         cin <= '1';
		
		 
         wait for 10 ns;
		 
		 --case9 
		op <= "01";
		a <= '0';
         b <= '0';
		 binv<= '1';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case10
		op <= "01";
		a <= '0';
         b <= '0';
		 binv<= '1';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --case11
		op <= "01";
		a <= '0';
         b <= '1';
		 binv<= '0';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case12
		 op <= "01";
		 a <= '0';
         b <= '1';
		 binv<= '0';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --cases13
		 op <= "01";
		 a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case14
		 op <= "01";
		 a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '1';
		
		 
         wait for 10 ns;
		 --case15
		 op <= "01";
		 a <= '1';
         b <= '1';
		 binv<= '0';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case16
		 op <= "01";
		 a <= '1';
         b <= '1';
		 binv<= '0';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --case17
		 op <= "10";
		 a <= '0';
         b <= '0';
		 binv<= '1';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case18
		 op <= "10";
		 a <= '0';
         b <= '0';
		 binv<= '1';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --case19
		 op <= "10";
		 a <= '0';
         b <= '1';
		 binv<= '0';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 
		 --case20
		 op <= "10";
		 a <= '0';
         b <= '1';
		 binv<= '0';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --case21
		 op <= "10";
		 a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case22
		 op <= "10";
		 a <= '1';
         b <= '0';
		 binv<= '1';
         cin <= '1';
		 
		 
         wait for 10 ns;
		 --case23
		 op <= "10";
		 a <= '1';
         b <= '1';
		 binv<= '0';
         cin <= '0';
		 
		 
         wait for 10 ns;
		 --case24
		 op <= "10";
		 a <= '1';
         b <= '1';
		 binv<= '0';
         cin <= '1';
		 
         wait for 10 ns;
		 
         wait;
   end process;
end TB;
configuration CFG_TB of ALU_1bit_TB is 
   for TB
   end for;
end CFG_TB; 
