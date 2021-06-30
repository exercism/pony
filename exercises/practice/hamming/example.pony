use "collections"
use "itertools"

primitive HammingDistance
  fun apply(strand1: String, strand2: String): USize ? =>
    if (strand1.size() != strand2.size()) then error end
    
    Iter[U8](strand1.values())
      .zip[U8](strand2.values())
      .filter({(t: (U8, U8)): Bool => t._1 != t._2 })
      .count()
