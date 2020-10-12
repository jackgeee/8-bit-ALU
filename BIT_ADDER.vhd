library ieee;
use ieee.std_logic_1164.all;

entity BIT_ADDER is
port( x1: in std_logic;
      x2: in std_logic;
      cin: in std_logic;
	  sum: out std_logic;
	  cout: out std_logic
      );
end BIT_ADDER;

architecture struct of BIT_ADDER is

   --use previously designed subcomponents
   component AND_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;
   
   component OR_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;
   
   component XOR_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;

   signal t1: std_logic; --to store the output of the AND gate
   signal t2: std_logic;
   signal t3: std_logic;

begin
   
   map_XOR_gate: XOR_gate port map (x1, x2, t1); 
    map_AND_gate: AND_gate port map (x1, x2, t2);
   map_XOR_gate1: XOR_gate port map (t1, cin, sum);
   map_AND_gate1: AND_gate port map (t1, cin, t3);
   map_OR_gate: OR_gate port map (t2, t3, cout);
   
   --map signals of the outer component to subcomponents - idea of parameter passing

end struct;
