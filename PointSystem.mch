MACHINE // 本にはMODELで記載されてる, 違いはなんだろう
  PointSystem
VARIABLES
  granted, used
INVARIANT
  granted: NATURAL & used: NATURAL & granted <= 10000 & used <= granted
INITIALISATION
  granted, used := 0,0
OPERATIONS
  sp <-- used_a_point = 
    PRE
      used < granted
    THEN
      sp, used := used + 1, used + 1
    END;
  ap <-- granted_a_point =
    PRE
      granted < 10000
    THEN
      ap, granted := granted + 1, granted + 1
    END   
END
