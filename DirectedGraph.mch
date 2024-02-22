MACHINE
  DirectedGraph
SETS
  NODE
VARIABLES
  Edge
INVARIANT
  Edge: NODE <-> NODE
INITIALISATION
  Edge := {}
OPERATIONS
  add_edge(n1, n2) =
    PRE
      n1: NODE & n2: NODE
    THEN
      Edge := Edge \/ { n1 |-> n2 }
    END;
  delete_edge(n1, n2) = 
    PRE
      n1: NODE & n2: NODE &
      n1 |-> n2: Edge
    THEN
      Edge := Edge - { n1 |-> n2}
    END
END
