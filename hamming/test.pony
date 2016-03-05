use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    var test = PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(recover _HammingTest end)

class _HammingTest iso is UnitTest
  """
  Test Hamming package
  """
  fun name(): String => "hamming/Hamming"

  fun apply(h: TestHelper): TestResult ? =>

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
    
    // TODO test for thrown errors on inputs of different lengths
    // h.assert_error(lambda()? => Hamming.apply("GATA", "GAT") end)
    // h.assert_error(lambda()? => Hamming.apply("GATA", "GAT") end)
    true
