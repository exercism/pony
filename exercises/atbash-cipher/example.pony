use "itertools"

primitive Atbash
  fun _transpose(c: U8): U8 =>
    if (('a' <= c) and (c <= 'z')) then
      ('z' - c) + 'a'
    else
      c
    end

  fun _transposable(c: U8): Bool =>
    (('a' <= c) and (c <= 'z')) or (('0' <= c) and (c <= '9'))

  fun _group(groups: Array[String ref], c: U8): Array[String ref]^ =>
    let last_idx = groups.size() - 1
    let last = try groups(last_idx)? else String end
    if last.size() < 5 then
      last.push(c)
    else
      last.push(' ')
      groups.push(String(6) .> push(c))
    end
    groups

  fun encode(input: String): String iso^ =>
    String.join(
      Iter[U8](input.lower().values())
        .filter(this~_transposable())
        .map[U8]({(c: U8): U8 => Atbash._transpose(c) })
        .fold[Array[String ref]]([String(6)], this~_group())
        .values())

  fun decode(input: String): String iso^ =>
    recover
      Iter[U8](input.values())
        .filter({(c: U8): Bool => c != ' '})
        .map[U8](this~_transpose())
        .collect[String ref](String)
    end
