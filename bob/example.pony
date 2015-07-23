use "regex"

// Not the best example. Will refactor when I grok the type system better.


class Bob
  let _default: String

  new create() =>
    _default = "Whatever."

  fun apply(phrase: String): String ? =>
    if loud(phrase) then
      "Whoa, chill out!"
    elseif question(phrase) then
      "Sure."
    elseif silent(phrase) then
      "Fine. Be that way!"
    else
      _default
    end

  fun loud(phrase: String): Bool ? =>
    (Regex("[A-Z]").eq(phrase)) and (phrase == phrase.upper())

  fun question(phrase: String): Bool =>
    let rephrase: String box = consume phrase
    rephrase.reverse().at("?",0)


  fun silent(phrase: String): Bool ? =>
    let rephrase: String box = consume phrase
    (rephrase.size() == 0) or Regex("^\\s+$").eq(rephrase)
