library ieee;
use ieee.std_logic_1164.all;

entity MUX_4x1 is
port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic;
      b: in std_logic;
	  c: in std_logic;
	  d: in std_logic;
      cout: out std_logic
      );
end MUX_4x1;


architecture struct of MUX_4x1 is

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
   
   component decoder4 is
   port(  op: in std_logic_vector(1 downto 0);
	 a1, a2, a3, a4: out std_logic
		);
	end component;

   signal temp1: std_logic; 
   signal temp2: std_logic; 
   signal temp3: std_logic; 
   signal temp4: std_logic; 
   signal temp5: std_logic; 
   signal temp6: std_logic; 
   signal temp7: std_logic; 
   signal temp8: std_logic; 
   signal temp9: std_logic; 
   signal temp10: std_logic; 
   
   

begin
   
   --map signals of the outer component to subcomponents - idea of parameter passing
   map_decoder4_gate: decoder4 port map (op, temp1, temp2, temp3, temp4);
   map_AND_gate: AND_gate port map (a, temp1, temp5);
   map_AND_gate_2: AND_gate port map (b, temp2, temp6);
   map_AND_gate_3:  AND_gate port map (c, temp3, temp7); 
   map_AND_gate_4: AND_gate port map (d, temp4, temp8);
   map_OR_gate: OR_gate port map (temp5, temp6, temp9);
   map_OR_gate_2: OR_gate port map (temp7, temp8, temp10);
   map_OR_gate_3: OR_gate port map(temp9, temp10, cout);
                                             

end struct;
