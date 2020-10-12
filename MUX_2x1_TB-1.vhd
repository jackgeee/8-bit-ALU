library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1_TB is
end MUX_2x1_TB;

architecture TB of  MUX_2x1_TB is

   component MUX_2x1 is
   port( x: in std_logic;
         y: in std_logic;
         z: in std_logic;
	    w: out std_logic
        );
   end component;

   signal x, y, z, w: std_logic;

   begin

      test_MUX_2x1: MUX_2x1 port map (x, y, z, w);

   process 
      begin
         --case1
         x <= '0';
         y <= '0';
         z <= '0';
         wait for 10 ns;
         
         --case2       
         x <= '0';
         y <= '1';
         z <= '0';
         wait for 10 ns;


         --case3
         x <= '1';
         y <= '0';
         z <= '0';
         wait for 10 ns;

         
         --case4
         x <= '1';
         y <= '1';
         z <= '0';
         wait for 10 ns;

         --case5
         x <= '0';
         y <= '0';
         z <= '1';
         wait for 10 ns;


         --case6
         x <= '0';
         y <= '1';
         z <= '1';
         wait for 10 ns;

         --case7
	     x <= '1';
         y <= '0';
         z <= '1';
         wait for 10 ns;

         --case8
         x <= '1';
         y <= '1';
         z <= '1';
         wait for 10 ns;
         

         wait;
   end process;

end TB;

configuration CFG_TB of MUX_2x1_TB is 
   for TB
   end for;
end CFG_TB; --or, lower case is OK (end cfg_TB)


