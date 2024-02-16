MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  LibrarySystem
// CONSTRAINTS // パラメタの制約宣言
// SEES  // 参照する抽象機械を宣言
// INCLUDES  // 取り込む抽象機械を宣言
// PROMOTES  // 取り込んだ抽象機械から引き継ぐ操作を宣言
// EXTENDS // 取り込んだ抽象機械の全ての操作を引き継ぎ, 拡張
// USES  // 制約と共に参照する抽象機械を宣言
SETS  // 集合の宣言
  PERSONS; BOOKS
// CONSTANTS // 定数の宣言
// PROPERTIES  // 集合・定数の制約宣言
VARIABLES // 変数の宣言
  books, issued
INVARIANT // 変数の不変条件宣言
  books: POW(BOOKS) &
  issued: books >+> PERSONS
  /* 集合Sから集合Tへの写像において
      全域[-]部分[+]: Sの全ての要素がTに対応付けられるかどうか
      単射[> >]全射[ ->>]: Sの異なる要素が, Tの異なる要素に対応付けられるかどうか. 
      全単射[> >>]: Sの全ての要素がTの全ての要素に1対1で対応付けられる
    ここでは, booksの全ての要素が対応付けられるわけではない(部分性) かつ 常に1冊しか借りられない(単射性)ので
      部分単射[>+>]になる
  */
INITIALISATION  // 変数の初期値宣言
  books, issued := {}, {}
OPERATIONS  // 操作の定義

ASSERTIONS  // 表明(assertion)の宣言, 表明は証明を容易にするための補題. 上から順に証明される

END