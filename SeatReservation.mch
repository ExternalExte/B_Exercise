MACHINE
  SeatReservation
SETS
  MEMBER; SEAT
CONSTANTS
  empty, capacity
PROPERTIES
  empty: MEMBER & capacity: NAT1 &
  card(SEAT) = capacity
VARIABLES
  reservation
INVARIANT
  reservation: SEAT --> MEMBER
INITIALISATION
  reservation := SEAT * {empty}
OPERATIONS
  make_reservation(mem, seat) =
    PRE
      mem: MEMBER & mem /= empty &
      seat: SEAT & reservation(seat) = empty
    THEN
      reservation(seat) := mem
    END;
  cancel(seat) =
    PRE
      seat: SEAT
    THEN
      reservation(seat) := empty
    END;
  mem <-- reservation_query(seat) =
    PRE
      seat: SEAT
    THEN
      mem := reservation(seat)
    END
END
