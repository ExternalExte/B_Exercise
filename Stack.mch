MACHINE
  Stack(VALUE)
VARIABLES
  stack
INVARIANT
  stack: seq(VALUE)
INITIALISATION
  stack := []
OPERATIONS
  push(value) =
    PRE
      value: VALUE
    THEN
      stack := stack <- value
    END;
  value <-- pop =
    PRE
      0 < size(stack)
    THEN
      value := tail(stack) ||
      stack := stack /|\ size(stack) - 1
    END
END
