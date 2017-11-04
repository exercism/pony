use "collections"
use "itertools"

primitive Squares
  fun square_of_sums(n: USize): USize =>
    let sum = (n * (n + 1)) / 2
    sum * sum

  fun sum_of_squares(n: USize): USize =>
    Iter[USize](Range(0, n + 1))
      .map[USize]({(x: USize): USize => x * x })
      .fold[USize](0, {(acc: USize, x: USize): USize => acc + x })

  fun difference(n: USize): USize =>
    square_of_sums(n) - sum_of_squares(n)
