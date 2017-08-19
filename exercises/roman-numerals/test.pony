use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestRomanNumerals)

class iso _TestRomanNumerals is UnitTest
  fun name(): String => "roman-numerals/RomanNumerals"

  fun apply(h: TestHelper) =>
    let tests: Array[(USize, String)] = [
      (0, "")
      (1, "I")
      (2, "II")
      (3, "III")
      (4, "IV")
      (5, "V")
      (6, "VI")
      (9, "IX")
      (27, "XXVII")
      (48, "XLVIII")
      (59, "LIX")
      (93, "XCIII")
      (141, "CXLI")
      (163, "CLXIII")
      (402, "CDII")
      (575, "DLXXV")
      (911, "CMXI")
      (1024, "MXXIV")
      (3000, "MMM")
    ]

    for test in tests.values() do
      try
        h.assert_eq[String](RomanNumerals(test._1)?, test._2)
      else
        h.fail()
      end
    end

    h.assert_error({() ? => RomanNumerals(-1)? })
    h.assert_error({() ? => RomanNumerals(4000)? })
