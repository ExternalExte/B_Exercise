MACHINE
  ReservationSystem(capacity)
CONSTRAINTS
  capacity: NAT & capacity <= 100
SETS
  MEMBER; STATUS = {yes, no}
CONSTANTS
  max_mems
PROPERTIES
  max_mems: NAT & card(MEMBER) = max_mems
VARIABLES
  reservation, available
INVARIANT
  reservation: MEMBER--> STATUS &
  available: NATURAL &
  capacity = card(reservation~[{yes}]) + available
INITIALISATION
  reservation, available := MEMBER*{no}, capacity
OPERATIONS
  make_a_reservation(pr) = 
    PRE
      pr: MEMBER &
      available > 0 &
      reservation(pr) = no
    THEN
      reservation, available :=
        reservation <+ {pr |-> yes}, available-1
    END
ASSERTIONS
  !pr.(pr: MEMBER & reservation(pr) = no
  => (reservation<+{pr |-> yes})~[{yes}] = reservation~[{yes}] \/ {pr})
END