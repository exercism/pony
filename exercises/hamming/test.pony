use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_HammingDistanceTest)
    test(_HammingParamTest)

class iso _HammingDistanceTest is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): None ? =>
    h.assert_eq[U8](0, Hamming("A", "A"))
    h.assert_eq[U8](0, Hamming("GGACTGA", "GGACTGA"))
    h.assert_eq[U8](1, Hamming("A", "G"))
    h.assert_eq[U8](2, Hamming("AG", "CT"))
    h.assert_eq[U8](1, Hamming("AT", "CT"))
    h.assert_eq[U8](1, Hamming("GGACG", "GGTCG"))
    h.assert_eq[U8](2, Hamming("ACCAGGG", "ACTATGG"))
    h.assert_eq[U8](1, Hamming("AGG", "AGA"))
    h.assert_eq[U8](4, Hamming("GATACA", "GCATAA"))
    h.assert_eq[U8](9, Hamming("GGACGGATTCTG", "AGGACGGATTCT"))

 class iso _HammingParamTest is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper) =>
    h.assert_error({()? => Hamming("GAT", "GA")})
    h.assert_error({()? => Hamming("GA", "GAC")})
