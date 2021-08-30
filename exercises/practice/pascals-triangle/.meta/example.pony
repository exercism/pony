use "collections"
use "itertools"

primitive PascalsTriangle
  fun rows(count: USize): Array[Array[USize]] =>
    Iter[USize](Range(0, count))
      .map[Array[USize]]({(n: USize): Array[USize] => PascalsTriangle.row(n) })
      .collect(Array[Array[USize]](count))

  fun row(n: USize): Array[USize] =>
    let r = Array[USize](n) .> push(1)
    for i in Range(1, n + 1) do
      try
        let last = r(i - 1)?
        r.push((last * ((n + 1) - i)) / i)
      end
    end
    r
