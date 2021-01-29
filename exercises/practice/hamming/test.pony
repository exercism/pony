use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestHammingDistance)

class iso _TestHammingDistance is UnitTest
  fun name(): String => "hamming/HammingDistance"

  fun apply(h: TestHelper) ? =>
    h.assert_eq[USize](0, HammingDistance("A", "A")?)
    h.assert_eq[USize](0, HammingDistance("GGACTGA", "GGACTGA")?)
    h.assert_eq[USize](1, HammingDistance("A", "G")?)
    h.assert_eq[USize](2, HammingDistance("AG", "CT")?)
    h.assert_eq[USize](1, HammingDistance("AT", "CT")?)
    h.assert_eq[USize](1, HammingDistance("GGACG", "GGTCG")?)
    h.assert_eq[USize](2, HammingDistance("ACCAGGG", "ACTATGG")?)
    h.assert_eq[USize](1, HammingDistance("AGG", "AGA")?)
    h.assert_eq[USize](4, HammingDistance("GATACA", "GCATAA")?)
    h.assert_eq[USize](9, HammingDistance("GGACGGATTCTG", "AGGACGGATTCT")?)

    h.assert_error({()? => HammingDistance("GAT", "GA")? })
    h.assert_error({()? => HammingDistance("GA", "GAC")? })
