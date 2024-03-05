MACHINE
  ReservationSystem(capacity)
CONSTRAINTS
  capacity: NAT & capacity <= 100
SETS
  MEMBER
CONSTANTS
  max_mems
PROPERTIES
  max_mems: NAT & card(MEMBER) = max_mems
VARIABLES
  available, reserved
INVARIANT
  available: NATURAL &
  reserved: FIN(MEMBER) &
  capacity = card(reserved) + available
INITIALISATION
  available, reserved := capacity, {}
OPERATIONS
  make_a_reservation(mem) =
    PRE
      mem: MEMBER &
      mem /: reserved &
      available > 0
    THEN
      available, reserved := available - 1, reserved \/ {mem}
    END
END
