
library ieee;
use ieee.std_logic_1164.all;
entity ALU_8bit_TB is
end ALU_8bit_TB;
architecture TB of ALU_8bit_TB is
  
   component ALU_8bit is
    port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic_vector(7 downto 0);
      b: in std_logic_vector(7 downto 0);
	  binv: in std_logic;
	  result: out std_logic_vector(7 downto 0);
	  overflow: out std_logic
      );
   end component;
   signal op: std_logic_vector(1 downto 0);
   signal a, b:  std_logic_vector(7 downto 0);
   signal  binv: std_logic;
   signal result:  std_logic_vector(7 downto 0);
   signal overflow: std_logic;
   begin
      test_ALU: ALU_8bit port map (op, a, b, binv, result, overflow);
   process 
      begin
        op <= "00";
		 a <= "11111111";
		 b <= "11111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case1 failed!" severity error;
		 
		 op <= "01";
		 a <= "11111111";
		 b <= "11111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case2 failed!" severity error;
		 
		 op <= "10";
		 a <= "11111111";
		 b <= "11111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111110" and overflow='0')	
		 report"case3 failed!" severity error;
		 
		 op <= "10";
		 a <= "11111111";
		 b <= "11111111";
		 binv <= '1';
         wait for 10 ns;
		 assert(result = "00000000" and overflow='0')	
		 report"case4 failed!" severity error;
		 
		 op <= "00";
		 a <= "01111111";
		 b <= "10000000";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "00000000" and overflow='0')	
		 report"case5 failed!" severity error;
		 
		 op <= "01";
		 a <= "01111111";
		 b <= "10000000";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case6 failed!" severity error;
		 
		 op <= "10";
		 a <= "01111111";
		 b <= "10000000";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case7 failed!" severity error;
		 
		 op <= "10";
		 a <= "01111111";
		 b <= "10000000";
		 binv <= '1';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='1')	
		 report"case8 failed!" severity error;
		 
		 op <= "00";
		 a <= "10000000";
		 b <= "01111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "00000000" and overflow='0')	
		 report"case9 failed!" severity error;
		 
		 op <= "01";
		 a <= "10000000";
		 b <= "01111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case10 failed!" severity error;
		 
		 op <= "10";
		 a <= "10000000";
		 b <= "01111111";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case11 failed!" severity error;
		 
		 op <= "10";
		 a <= "10000000";
		 b <= "01111111";
		 binv <= '1';
         wait for 10 ns;
		 assert(result = "00000001" and overflow='1')	
		 report"case12 failed!" severity error;
		 
		 op <= "00";
		 a <= "01010101";
		 b <= "10101010";
		 binv<= '0';
         wait for 10 ns;
		 assert(result = "00000000" and overflow='0')	
		 report"case13 failed!" severity error;
		 
		 op <= "01";
		 a <= "01010101";
		 b <= "10101010";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case14 failed!" severity error;
		 
		 op <= "10";
		 a <= "01010101";
		 b <= "10101010";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111111" and overflow='0')	
		 report"case15 failed!" severity error;
		 
		 op <= "10";
		 a <= "01010101";
		 b <= "10101010";
		 binv<= '1';
         wait for 10 ns;
		 assert(result = "10101011" and overflow='1')	
		 report"case16 failed!" severity error;
		 
		 op <= "00";
		 a <= "11011011";
		 b <= "10101010";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "10001010" and overflow='0')	
		 report"case17 failed!" severity error;
		 
		 op <= "01";
		 a <= "11011011";
		 b <= "10101010";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "11111011" and overflow='0')	
		 report"case18 failed!" severity error;
		 
		 op <= "10";
		 a <= "11011011";
		 b <= "10101010";
		 binv <= '0';
         wait for 10 ns;
		 assert(result = "10000101" and overflow='0')	
		 report"case19 failed!" severity error;
		 
		 op <= "10";
		 a <= "11011011";
		 b <= "10101010";
		 binv <= '1';
         wait for 10 ns;
		 assert(result = "00110001" and overflow='0')	
		 report"case20 failed!" severity error;
		 
		 
         wait;
   end process;
end TB;
configuration CFG_TB of ALU_8bit_TB is 
   for TB
   end for;
end CFG_TB; 
