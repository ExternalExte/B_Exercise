MACHINE
  PointSystemWithIf2
INCLUDES
  PointSystem
OPERATIONS
  sp <-- try_to_use =
    IF
      used < granted
    THEN
      sp <-- use_a_point
    ELSE
      sp := 0
    END;
  ap <-- try_to_grant =
    IF
      granted < 10000
    THEN
      ap <-- grant_a_point
    ELSE
      ap := 0
    END
END
