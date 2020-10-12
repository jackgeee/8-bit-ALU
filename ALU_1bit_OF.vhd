library ieee;
use ieee.std_logic_1164.all;

entity ALU_1bit_OF is
port( op: in std_logic_vector(1 downto 0);
	  a: in std_logic;
      b: in std_logic;
	  binv: in std_logic;
	  cin: in std_logic;
      cout: out std_logic;
	  result: out std_logic;
	  overflow: out std_logic
      );
end ALU_1bit_OF;

architecture struct of ALU_1bit_OF is


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
   
    component NOT_gate is
   port( x: in std_logic;
        y: out std_logic
     );
	end component;
   
   component MUX_2X1 is
	port ( x: in std_logic;
       y: in std_logic;
       z: in std_logic;
	   w: out std_logic
	);
	end component;
   
   component BIT_ADDER is
   port ( x1: in std_logic;
      x2: in std_logic;
      cin: in std_logic;
	  sum: out std_logic;
	  cout: out std_logic
		);
	end component;
   
   component XOR_gate is 
   port( x: in std_logic;
      y: in std_logic;
      z: out std_logic
     );
   end component;
   
   component MUX_4x1 is
   port (   op: in std_logic_vector(1 downto 0);
			a: in std_logic;
			b: in std_logic;
			c: in std_logic;
			d: in std_logic; 
			cout: out std_logic
   );
   end component;
   

   signal temp1: std_logic;
   signal temp2: std_logic; 
   signal notofb: std_logic;
   signal temp3: std_logic;
   signal temp4: std_logic;
   signal temp5: std_logic;
   


begin
   
   --map signals of the outer component to subcomponents - idea of parameter passing
   map_NOT_gate: NOT_gate port map (b, notofb);
   map_MUX_2X1: MUX_2X1 port map(b, notofb, binv,temp4);
   map_AND_gate: AND_gate port map (a, temp4, temp1);
   map_OR_gate: OR_gate port map (a, temp4, temp2);
   map_BIT_ADDER: BIT_ADDER port map (a, temp4, cin, temp3, temp5);
   cout<=temp5;
   map_MUX_4X1: MUX_4X1 port map (op, temp1, temp2, temp3, '0', result);
   map_XOR_gate: XOR_gate port map (cin, temp5, overflow);
  

end struct;
