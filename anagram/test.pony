use "ponytest"
use "collections"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_AnagramTest)

class _AnagramTest iso is UnitTest
  """
  Test Anagram package 
  """
  fun name(): String => "anagram/Anagram"

  fun apply(h: TestHelper): TestResult ? =>
    let anagrams =  ["hello", "zombies", "pants"]
    let emptyArray: Array[String] = Array[String]
    let helloArray = ["hello"]

    h.assert_array_eq[String](emptyArray, Anagram("banana", anagrams))
    h.assert_array_eq[String](helloArray, Anagram("hello", anagrams))
    true 