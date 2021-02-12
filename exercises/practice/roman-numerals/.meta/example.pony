use "collections"

primitive RomanNumerals
  fun apply(n: USize): String ? =>
    if n == 0 then
      return ""
    elseif n >= 4000 then
      error
    end

    let numerals: Array[(USize, String)] = [
      (1000, "M")
      (900, "CM")
      (500, "D")
      (400, "CD")
      (100, "C")
      (90, "XC")
      (50, "L")
      (40, "XL")
      (10, "X")
      (9, "IX")
      (5, "V")
      (4, "IV")
      (1, "I")
    ]

    let str = recover String end
    var n' = n
    for (arabic, roman) in numerals.values() do
      while n' >= arabic do
        str.append(roman)
        n' = n' - arabic
      end
    end
    str
