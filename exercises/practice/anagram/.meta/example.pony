use "collections"
use "itertools"

primitive Anagram
  fun apply(word: String, phrase: Array[String]): Array[String] =>
    let lower: String = word.lower()
    let sorted = _strsort(lower)

    Iter[String](phrase.values())
      .filter({(s: String)(lower, sorted): Bool =>
        let lower': String = s.lower()
        (lower != lower') and (sorted == Anagram._strsort(lower'))
      })
      .collect(Array[String])

  fun _strsort(s: String): String =>
    String.from_array(recover Sort[Array[U8], U8](s.array().clone()) end)
