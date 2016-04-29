use "collections"

class Squares
  let _max: U32

  new create(max: U32) =>
    _max = max + 1

  fun square_of_sums(): U32 =>
    var sum: U32 = 0
    let rng: Range[U32] = Range[U32](1, _max)

    while rng.has_next() do
      sum = sum + rng.next()
    end

    sum * sum

  fun sum_of_squares(): U32 =>
    var sum: U32 = 0
    let rng: Range[U32] = Range[U32](1, _max)

    while rng.has_next() do
      var t: U32 = rng.next()
      sum = sum + (t * t)
    end

    sum

  fun difference(): U32 =>
    square_of_sums() - sum_of_squares()
