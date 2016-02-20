use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_HammingTest)

class _HammingTest iso is UnitTest
  """
  Test Hamming package
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
    h.expect_error(lambda()? => Hamming("AATG", "AAA") end)
    h.expect_error(lambda()? => Hamming("ATA", "AGTG") end)
