#define ATS_DYNLOADFLAG 0
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define i32 int
staload ARRAYS = "src/SATS/arrays.sats"

implement
$ARRAYS.push_zero_start {n}(arr, n) =
 i2sz(0)
