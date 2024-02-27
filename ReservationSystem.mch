MACHINE // 抽象機械の名前とパラメタ(抽象機械に与える入力)の宣言
  ReservationSystem(capacity) // capacity: スカラーパラメタ, See also: 集合パラメタ
CONSTRAINTS // パラメタの制約宣言
  capacity: NAT & capacity <= 100
SETS  // 集合の宣言
  MEMBER; BOOL
CONSTANTS // 定数の宣言
  max_mems
PROPERTIES  // 集合・定数の制約宣言
  max_mems: NAT & card(MEMBER) = max_mems
VARIABLES // 変数の宣言
  reservation, available
INVARIANT // 変数の不変条件宣言
  /*
    WellDefinednessInvariant 	Unproved 1
  */
  reservation: MEMBER --> BOOL &
  available: NATURAL &
  capacity = card(reservation~[{TRUE}]) + available
INITIALISATION  // 変数の初期値宣言
  reservation, available := MEMBER * {FALSE}, capacity
OPERATIONS  // 操作の定義
  make_a_reservation(mem) = 
    PRE
      mem: MEMBER &
      available > 0 &
      reservation(mem) = FALSE
    THEN
      reservation, available :=
        reservation <+ {mem |-> TRUE}, available-1
    END
ASSERTIONS  // 表明(assertion)の宣言, 表明は証明を容易にするための補題. 上から順に証明される
  !mem.(mem: MEMBER & reservation(mem) = FALSE => 
    (reservation<+{mem |-> TRUE})~[{TRUE}] = reservation~[{TRUE}] \/ {mem})
END
