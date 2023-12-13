#include "share/atspre_define.hats"

#define i32 int

fun
push_zero_start
{n: nat}
(
  v: &(@[i32][n])
): size_t
