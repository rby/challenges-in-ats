#define ATS_DYNLOADFLAG 0
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define i32 int
staload ARRAYS = "src/SATS/arrays.sats"

implement
$ARRAYS.push_zero_start {n}(arr, n) =
  loop(i2sz(0), i2sz(0), arr, n) where {
    fun
    loop
    {n, i, j :nat | i <= j && j <= n}
    .<n-j>.
    (
      i: size_t(i),
      j: size_t(j),
      arr: &(@[i32][n]),
      n: size_t(n)
    ):<!wrt> sizeLte(n) =
    if j < n then
        if arr[j] = 0 then
          let val () = array_interchange(arr, i, j)
          in loop(i + 1, j + 1, arr, n) end
        else
          loop(i, j + 1, arr, n)
    else
      i
  }
