use "pony_test"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_AnagramTest)

class iso _AnagramTest is UnitTest
  fun name(): String => "anagram/Anagram"

  fun apply(h: TestHelper) =>
    let anagrams =  ["banana"; "bob"; "sent"; "sale"; "ales"]
    let empty = Array[String]

    // Anagram should return an empty array if there are no anagrams
    h.assert_array_eq[String](empty, Anagram("bobs", anagrams))
    // Anagram should ignore same words, those aren't anagrams
    h.assert_array_eq[String](empty, Anagram("banana", anagrams))
    // Anagram shouldn't be based on checksum
    h.assert_array_eq[String](empty, Anagram("last", ["mass"]))
    // Anagram should return an array of anagrams if present
    h.assert_array_eq[String](["sent"], Anagram("nets", anagrams))
    // Anagram should be case insensitive
    h.assert_array_eq[String](["sent"], Anagram("nETs", anagrams))
    // Anagram should return multiple anagrams
    h.assert_array_eq[String](["sale"; "ales"], Anagram("seal", anagrams))
