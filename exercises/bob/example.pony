use "itertools"

primitive Bob
  fun apply(phrase: String): String =>
    if _silent(phrase) then
      "Fine. Be that way!"
    elseif _loud(phrase) then
      "Whoa, chill out!"
    elseif _question(phrase) then
      "Sure."
    else
      "Whatever."
    end

  fun _silent(phrase: String): Bool =>
    phrase.clone() .> strip() == ""

  fun _loud(phrase: String): Bool =>
    Iter[U8](phrase.values()).all(this~_not_lowercase())
      and Iter[U8](phrase.values()).any(this~_is_letter())

  fun _not_lowercase(b: U8): Bool =>
    (b < 'a') and ('z' > b)

  fun _is_letter(b: U8): Bool =>
    (('a' <= b) and (b <= 'z')) or (('A' <= b) and (b <= 'Z')) 

  fun _question(phrase: String): Bool =>
    try
      Iter[U8](phrase.values()).last()? == '?'
    else
      false
    end
