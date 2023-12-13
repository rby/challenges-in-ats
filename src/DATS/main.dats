#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload ARRAYS = "src/SATS/arrays.sats"
staload "src/DATS/arrays.dats"

extern castfn int_of_lint(l: lint) : int

val _ = $STDLIB.srandom(42u)

fn random{n: nat}(n: int n): intBtwe(0, n) =
    if n <= 0 then 0
    else
        if $STDLIB.random() % 100l < 20
            then 0
            else
                let val r = $STDLIB.random()
                in nmod(max(g1ofg0_int(int_of_lint(r)), 0), n) end


fun {a:t@ype} println_arr{n: int}(arr: &(@[a][n]), n: size_t(n)): void =
  (
   print!("[");
   fprint_array_sep(stdout_ref, arr, n, ", ");
   println!("]")
  )

fun {a:t@ype} println_arr_pre{n: int}(pre: string, arr: &(@[a][n]), n: size_t(n)): void =
  (print!(pre); println_arr(arr, n))

fun randint_init{n: nat}(arr: &(@[int][n]), n: size_t n): void =
    loop(arr, n, i2sz(0)) where {
        fun loop{i, n: nat | i <= n}(arr: &(@[int][n]), n: size_t n, i: size_t i): void =
        if i < n then (arr[i] := random(100) ;loop(arr, n, i + 1))
        else ()
    }

fun ex_arrays() : void =
    let
        val N = i2sz(10)
        var arr = @[int][N](0)
        val () = randint_init(arr, N)
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
