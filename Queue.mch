MACHINE
  Queue(VALUE)
VARIABLES
  queue
INVARIANT
  queue: seq(VALUE)
INITIALISATION
  queue := {}
OPERATIONS
  push(value) =
    PRE
      value: VALUE
    THEN
      queue := queue <- value
    END;
  value <-- pop =
    PRE
      0 < size(queue)
    THEN
      value := front(queue) ||
      queue := queue \|/ 1
    END
END
