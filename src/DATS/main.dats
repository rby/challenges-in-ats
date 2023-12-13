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

fun {a:t@ype} println_arr_pre{n: int}(pre: string, arr: &(@[a][n]), n: size_t(n)): void =
  (print!(pre); println_arr(arr, n))

fun ex_arrays() : void =
    let
        val N: size_t(3) = i2sz(3) 
        var arr = @[int][N](0)
        val () = arr[0] := 1
        val () =  println_arr_pre<int>("before: ", arr, N)
        val res = $ARRAYS.push_zero_start(arr, N)
        val () =  println_arr_pre<int>("after:  ", arr, N)
    in
    // nothing
    end

implement main0() = let
    val () = ex_arrays()
in
// nothing
end
