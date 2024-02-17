MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  DirectedGraph
// CONSTRAINTS // パラメタの制約宣言
// SEES  // 参照する抽象機械を宣言
// INCLUDES  // 取り込む抽象機械を宣言
// PROMOTES  // 取り込んだ抽象機械から引き継ぐ操作を宣言
// EXTENDS // 取り込んだ抽象機械の全ての操作を引き継ぎ, 拡張
// USES  // 制約と共に参照する抽象機械を宣言
SETS  // 集合の宣言
  NODE
// CONSTANTS // 定数の宣言
// PROPERTIES  // 集合・定数の制約宣言
VARIABLES // 変数の宣言
  Edge
INVARIANT // 変数の不変条件宣言
  Edge: NODE <-> NODE
  /* 集合Sから集合Tへの写像において
      全域[-]部分[+]: Sの全ての要素がTに対応付けられるかどうか
      単射[> >]全射[ ->>]: Sの異なる要素が, Tの異なる要素に対応付けられるかどうか. 
      全単射[> >>]: Sの全ての要素がTの全ての要素に1対1で対応付けられる
  */
INITIALISATION  // 変数の初期値宣言
  Edge := {}
OPERATIONS  // 操作の定義
  add_edge(n1, n2) =
    PRE
      n1: NODE & n2: NODE
    THEN
      Edge := Edge \/ { n1 |-> n2 }
    END
// ASSERTIONS  // 表明(assertion)の宣言, 表明は証明を容易にするための補題. 上から順に証明される
END