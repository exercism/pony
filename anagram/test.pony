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

    //Anagram should return an empty array if there are no anagrams
    h.assert_array_eq[String](emptyArray, Anagram("banana", anagrams))
    // Anagram should ignore same words, those aren't anagrams
    h.assert_array_eq[String](emptyArray, Anagram("hello", anagrams))
    true 