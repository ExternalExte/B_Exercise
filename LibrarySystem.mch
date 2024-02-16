MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  LibrarySystem
CONSTRAINTS // パラメタの制約宣言

SEES  // 参照する抽象機械を宣言

INCLUDES  // 取り込む抽象機械を宣言

PROMOTES  // 取り込んだ抽象機械から引き継ぐ操作を宣言

EXTENDS // 取り込んだ抽象機械の全ての操作を引き継ぎ, 拡張

USES  // 制約と共に参照する抽象機械を宣言

SETS  // 集合の宣言

CONSTANTS // 定数の宣言

PROPERTIES  // 集合・定数の制約宣言

VARIABLES // 変数の宣言

INVARIANT // 変数の不変条件宣言

INITIALISATION  // 変数の初期値宣言

OPERATIONS  // 操作の定義

ASSERTIONS  // 表明(assertion)の宣言, 表明は証明を容易にするための補題. 上から順に証明される

END