library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1 is
port( x: in std_logic;
      y: in std_logic;
      z: in std_logic;
	 w: out std_logic
     );
end MUX_2x1;

architecture behav of MUX_2x1 is
begin

   process(x, y, z)
   begin
      if (z='0')then
         w <= x;
      else
         w <= y;
      end if;
   end process;
end behav;
