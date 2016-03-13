use "PonyTest"

class Anagram

  fun apply(word: String, phrase: Array[String]): Array[String] ?  =>
    let anagrams: Array[String] = Array[String]
    let word_array: Array[U8] = _to_array_and_order(word.lower())


    for (index, value) in phrase.pairs() do
      let value_array: Array[U8] = _to_array_and_order(value.lower())
      
      if value.size() != word.size() then continue end
      if value.lower() == word.lower() then continue end
      if _check_array_eq(word_array, value_array) then
        anagrams.push(value)
      end
    end

    anagrams
        
  fun _to_array_and_order(word': String): Array[U8] ? =>
    let word_array: Array[U8] = Array[U8]
    let sorted_array: Array[U8] = Array[U8]
    let word = word'

    for value in word.values() do
      word_array.push(value)
    end

    
    for (index, value) in word_array.pairs() do
      var inserted = false
      if (index == 0) then sorted_array.push(value) end
      if (index > 0) then
        for (i, v) in sorted_array.pairs() do
          if value <= v then
            sorted_array.insert(i, value)
            inserted = true
            break
          end
        end
        if not inserted then
          sorted_array.push(value)
          inserted = false
        end
      end
    end

    sorted_array

  // https://github.com/ponylang/ponyc/blob/master/packages/ponytest/helper.pony#L163-L188
  fun _check_array_eq(expect: Array[U8], actual: Array[U8]): Bool ? =>
    var ok = true

    if expect.size() != actual.size() then
      ok = false
    else
      var i: U64 = 0
      while i < expect.size() do
        if expect(i) != actual(i) then
          ok = false
          break
        end

        i = i + 1
      end
    end
    ok