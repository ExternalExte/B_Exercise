MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  DirectedGraph
SETS  // 集合の宣言
  NODE
VARIABLES // 変数の宣言
  Edge
INVARIANT // 変数の不変条件宣言
  Edge: NODE <-> NODE
INITIALISATION  // 変数の初期値宣言
  Edge := {}
OPERATIONS  // 操作の定義
  add_edge(n1, n2) =
    PRE
      n1: NODE & n2: NODE
    THEN
      Edge := Edge \/ { n1 |-> n2 }
    END
END