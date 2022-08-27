use "pony_test"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestHammingDistance)

class iso _TestHammingDistance is UnitTest
  fun name(): String => "hamming/HammingDistance"

  fun apply(h: TestHelper) ? =>
    // Empty strands
    h.assert_eq[USize](0, HammingDistance("", "")?)
    // Single letter, identical strands
    h.assert_eq[USize](0, HammingDistance("A", "A")?)
    // Identical strands
    h.assert_eq[USize](0, HammingDistance("GGACTGA", "GGACTGA")?)
    // Single letter, different strands
    h.assert_eq[USize](1, HammingDistance("A", "G")?)
    // Two 2-length strands, all differ
    h.assert_eq[USize](2, HammingDistance("AG", "CT")?)
    // Two 2-length strands, first differs, second matches
    h.assert_eq[USize](1, HammingDistance("AT", "CT")?)
    // Two 5-length strands, single difference in the middle
    h.assert_eq[USize](1, HammingDistance("GGACG", "GGTCG")?)
    // Two 7-length strands, two differences separated
    h.assert_eq[USize](2, HammingDistance("ACCAGGG", "ACTATGG")?)
    // Two 3-length strands, final character differs
    h.assert_eq[USize](1, HammingDistance("AGG", "AGA")?)
    // Two 6-length strands, four differences
    h.assert_eq[USize](4, HammingDistance("GATACA", "GCATAA")?)
    // Two 12-length strands, nine differences
    h.assert_eq[USize](9, HammingDistance("GGACGGATTCTG", "AGGACGGATTCT")?)

    // Two strands of differing length, first is longer.
    h.assert_error({()? => HammingDistance("GAT", "GA")? })
    // Two strands of differing length, second is longer.
    h.assert_error({()? => HammingDistance("GA", "GAC")? })
