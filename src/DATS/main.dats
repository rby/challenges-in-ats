#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload ARRAYS = "src/SATS/arrays.sats"
staload "src/DATS/arrays.dats"

fun {a:t@ype} println_arr{n: int}(arr: &(@[a][n]), n: size_t(n)): void =
  (
   print!("[");
   fprint_array_sep(stdout_ref, arr, n, ", ");
   println!("]")
  )

fun ex_arrays() : void =
    let
        val N: size_t(3) = i2sz(3) 
        var arr = @[int][n](1)
        val () = (print!("input:  "); println_arr<int>(arr, N))
        val res = $ARRAYS.push_zero_start(arr)
        val () = (print!("output: "); println_arr<int>(arr, N))
    in
    // nothing
    end

implement main0() = let
    val () = ex_arrays()
in
// nothing
end
