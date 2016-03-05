use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    var test = PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(recover _HammingParamTest end)
    test(recover _HammingDistanceTest end)

class _HammingDistanceTest iso is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): TestResult ? =>
    // Note -> Current master-branch simplifies these functions to 
    // assert_eq, and removes expect
    // https://github.com/ponylang/ponyc/blob/master/packages/ponytest/helper.pony

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
    true

 class _HammingParamTest iso is UnitTest
  """
  Test Hamming package returns the right distance
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): TestResult =>
    h.expect_error(lambda()? => Hamming("GAT", "GA") end)
    h.expect_error(lambda()? => Hamming("GA", "GAC") end)
