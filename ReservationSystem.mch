MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  ReservationSystem(capacity) // capacity: スカラーパラメタ, See also: 集合パラメタ
CONSTRAINTS // パラメタの制約宣言
  capacity: NAT & capacity <= 100
SETS  // 集合の宣言
  MEMBER; STATUS = {yes, no}
CONSTANTS // 定数の宣言
  max_mems
PROPERTIES  // 集合・定数の制約宣言
  max_mems: NAT & card(MEMBER) = max_mems
VARIABLES // 変数の宣言
  available, reserved
INVARIANT // 変数の不変条件宣言
  available: NATURAL & reserved: FIN(MEMBER) & capacity = card(reserved) + available
INITIALISATION  // 変数の初期値宣言
  available, reserved := capacity, {}
OPERATIONS  // 操作の定義
  make_a_reservation(mem) = 
    PRE
      mem: MEMBER &
      mem /: reserved &
      available > 0
    THEN
      available, reserved := available-1, reserved \/ {mem}
    END
END
