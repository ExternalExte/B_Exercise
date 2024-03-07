MACHINE
  List(VALUE, list_size, default)
CONSTRAINTS
  list_size: NAT1 &
  default: VALUE
VARIABLES
  list
INVARIANT
  list: seq(VALUE) &
  size(list) = list_size
INITIALISATION
  list := %index.(index: 1..list_size | default)
OPERATIONS
  value <-- at(index) =
    PRE
      index: NAT1 &
      index: dom(list)
    THEN
      value := list(index)
    END;
  assign(index, value) =
    PRE
      index: NAT1 &
      index: dom(list) &
      value: VALUE
    THEN
      list(index) := value
    END;
  fill(value) =
    PRE
      value: VALUE
    THEN
      list := %index.(index: dom(list) | value)
    END;
  range <-- search(value) =
    PRE
      value: VALUE
    THEN
      range := list~[{value}]
    END
END
