use "PonyTest"

class Anagram

  fun apply(word: String, phrase: Array[String]): Array[String]  =>
    let default: Array[String] = Array[String]

    for (index, value) in phrase.pairs() do
      // reject same word as not anagram
      if value.lower() == word.lower() then phrase.remove(index, 1) end
      // if _check_array_eq_unordered[String](
      //   _split_and_order(value),
      //   _split_and_order(word)) then
      //   phrase
      // else
      //   phrase.remove(index, 1) 
      // end
    end

    if phrase.size() > 0 then
      phrase
    else
      default
    end
        
  fun _split_and_order(word: String): Array[String] =>
    let newWord: Array[String] = word.lower().split("")
    newWord

  // Trying to use the compiler libraries unordered array check :(
  
  // fun _check_array_eq_unordered[A: (Equatable[A] & Stringable)]
  //   (verb: String, expect: ReadSeq[A], actual: ReadSeq[A], msg: String): Bool
  // =>
  //   """
  //   Check that the contents of the 2 given ReadSeqs are equal.
  //   """
  //   try
  //     let missing = Array[A]
  //     let consumed = Array[Bool].init(false, actual.size())
  //     for e in expect.values() do
  //       var found = false
  //       var i: USize = -1
  //       for a in actual.values() do
  //         i = i + 1
  //         if consumed(i) then continue end
  //         if e == a then
  //           consumed.update(i, true)
  //           found = true
  //           break
  //         end
  //       end
  //       if not found then
  //         missing.push(e)
  //       end
  //     end

  //     let extra = Array[A]
  //     for (i, c) in consumed.pairs() do
  //       if not c then extra.push(actual(i)) end
  //     end

  //     if (extra.size() != 0) or (missing.size() != 0) then
  //       assert_failed(
  //         verb + " EQ_UNORDERED failed. " + msg + " Expected (" +
  //         _print_array[A](expect) + ") == (" + _print_array[A](actual) + "):" +
  //         "\nMissing: " + _print_array[A](missing) +
  //         "\nExtra: " + _print_array[A](extra))
  //       return false
  //     end
  //     log(
  //       verb + " EQ_UNORDERED passed. " + msg + " Got (" +
  //       _print_array[A](expect) + ") == (" + _print_array[A](actual) + ")",
  //       true)
  //     true
  //   else
  //     assert_failed(verb + " EQ_UNORDERED failed from an internal error.")
  //     false
  //   end

