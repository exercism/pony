use "collections"

class Hamming
  let _name: String

  new create() =>
    _name = "Hamming"

  fun apply(strand1: String, strand2: String): U8 ? =>
    if (strand1.size() != strand2.size()) then error end

    compute_distance(strand1, strand2)

  fun compute_distance(strand1: String, strand2: String): U8 ? =>
    let size: U64 = strand1.size()
    var dist: U8 = U8(0)
    var idx: I64 = 0

    while idx < size.i64() do
      if (strand1.at_offset(idx).ne(strand2.at_offset(idx))) then
        dist = dist + 1
      end
      idx = idx + 1
    end

    dist
