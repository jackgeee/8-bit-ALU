library ieee;
use ieee.std_logic_1164.all;

entity ALU_8bit is
port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic_vector(7 downto 0);
      b: in std_logic_vector(7 downto 0);
	  binv: in std_logic;
	  result: out std_logic_vector(7 downto 0);
	  overflow: out std_logic
      );
end ALU_8bit;

architecture struct of ALU_8bit is

   component ALU_1bit is
   port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic;
      b: in std_logic;
	  binv: in std_logic;
	  cin: in std_logic;
      cout: out std_logic;
	  result: out std_logic
      );
   end component;

   component ALU_1bit_OF is
   port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic;
      b: in std_logic;
	  binv: in std_logic;
	  cin: in std_logic;
      cout: out std_logic;
	  result: out std_logic;
	  overflow: out std_logic
      );
	end component;
   
   signal C1: std_logic;
   signal C2: std_logic; 
   signal C3: std_logic;
   signal C4: std_logic;
   signal C5: std_logic;
   signal C6: std_logic;
   signal C7: std_logic;
   signal C8: std_logic;
  


begin

   --map signals of the outer component to subcomponents - idea of parameter passing
   map_ALU_1bit_1: ALU_1bit port map (op, a(0),b(0),binv,binv,C1,result(0));
   map_ALU_1bit_2: ALU_1bit port map (op, a(1),b(1),binv,C1,C2,result(1));
   map_ALU_1bit_3: ALU_1bit port map (op, a(2),b(2),binv,C2,C3,result(2));
   map_ALU_1bit_4: ALU_1bit port map (op, a(3),b(3),binv,C3,C4,result(3));
   map_ALU_1bit_5: ALU_1bit port map (op, a(4),b(4),binv,C4,C5,result(4));
   map_ALU_1bit_6: ALU_1bit port map (op, a(5),b(5),binv,C5,C6,result(5));
   map_ALU_1bit_7: ALU_1bit port map (op, a(6),b(6),binv,C6,C7,result(6));
   map_ALU_1bit_8: ALU_1bit_OF port map (op, a(7),b(7),binv,C7,C8,result(7),overflow);


end struct;
