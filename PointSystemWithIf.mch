MACHINE
  PointSystemWithIf
VARIABLES
  granted, used
INVARIANT
  granted: NATURAL & used: NATURAL & granted <= 10000 & used <= granted
INITIALISATION
  granted, used := 0,0
OPERATIONS
  sp <-- try_to_use =
    IF
      used < granted
    THEN
      sp, used := used + 1, used + 1
    ELSE
      sp := 0
    END;
  ap <-- try_to_grant =
    IF
      granted < 10000
    THEN
      ap, granted := granted + 1, granted + 1
    ELSE
      ap := 0
    END
END
