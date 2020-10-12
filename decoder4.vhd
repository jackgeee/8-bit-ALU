library ieee;
use ieee.std_logic_1164.all;

entity decoder4 is
port(op: in std_logic_vector(1 downto 0);
	 a1: out std_logic;
	 a2: out std_logic;
	 a3: out std_logic;
	 a4: out std_logic
      );
end decoder4;

architecture struct of decoder4 is

   component AND_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;

   component NOT_gate is
   port( x: in std_logic;
         y: out std_logic
        );
   end component;
   
   signal temp1: std_logic;
   signal temp2: std_logic; 

begin
   
   --map signals of the outer component to subcomponents - idea of parameter passing
   map_NOT_gate: NOT_gate port map (op(0), temp1);
   map_NOT2_gate: NOT_gate port map (op(1), temp2);
   map_AND_gate: AND_gate port map (temp1, temp2, a1);
   map_AND2_gate: AND_gate port map (op(0), temp2, a2);
   map_AND3_gate: AND_gate port map (temp1, op(1), a3);
   map_AND4_gate: AND_gate port map (op(0), op(1), a4);
  

end struct;
