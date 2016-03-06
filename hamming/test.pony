use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_HammingDistanceTest)
    test(_HammingParamTest)

class _HammingDistanceTest iso is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): TestResult ? =>
    h.expect_eq[U8](0, Hamming("A", "A"))
    h.expect_eq[U8](0, Hamming("GGACTGA", "GGACTGA"))
    h.expect_eq[U8](1, Hamming("A", "G"))
    h.expect_eq[U8](2, Hamming("AG", "CT"))
    h.expect_eq[U8](1, Hamming("AT", "CT"))
    h.expect_eq[U8](1, Hamming("GGACG", "GGTCG"))
    h.expect_eq[U8](2, Hamming("ACCAGGG", "ACTATGG"))
    h.expect_eq[U8](1, Hamming("AGG", "AGA"))
    h.expect_eq[U8](4, Hamming("GATACA", "GCATAA"))
    h.expect_eq[U8](9, Hamming("GGACGGATTCTG", "AGGACGGATTCT"))

 class _HammingParamTest iso is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): TestResult =>
    h.expect_error(lambda()? => Hamming("GAT", "GA") end)
    h.expect_error(lambda()? => Hamming("GA", "GAC") end)
