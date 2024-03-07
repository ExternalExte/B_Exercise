MACHINE
  ARRAY(VALUE, maxidx)
CONSTRAINTS
  maxidx: NAT1
VARIABLES
  arr_vrb
INVARIANT
  arr_vrb: 1..maxidx --> VALUE
INITIALISATION
  arr_vrb:: 1..maxidx --> VALUE
OPERATIONS
  vv <-- VAL_ARRAY(ii) =
    PRE
      ii: 1..maxidx
    THEN
      vv := arr_vrb(ii)
    END;
  STR_ARRAY(ii, vv) =
    PRE
      ii: 1..maxidx &
      vv: VALUE
    THEN
      arr_vrb(ii) := vv
    END;
  SET_ARRAY(ii, jj, vv) =
    PRE
      ii: 1..maxidx &
      jj: 1..maxidx &
      vv: VALUE &
      ii < jj
    THEN
      arr_vrb := arr_vrb <+ %index.(index: ii..jj | vv)
    END;
  SWAP_ARRAY(ii, jj) =
    PRE
      ii: 1..maxidx &
      jj: 1..maxidx
    THEN
      arr_vrb :=
        arr_vrb <+ {ii|-> arr_vrb(ii), jj|-> arr_vrb(ii)}
    END;
  rr,bb <-- SEARCH_MIN_EQL_ARRAY(ii, jj, vv) =
    PRE
      ii: 1..maxidx &
      jj: 1..maxidx &
      vv: VALUE
    THEN
      LET
        ss
      BE
        ss = ii..jj  /\ arr_vrb~[{vv}]
      IN
        bb := bool(ss /= {}) ||
        rr := min(ss \/ {maxidx})
      END
    END
END
