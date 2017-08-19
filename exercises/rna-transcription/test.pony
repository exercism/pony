use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestRNATrancription)

class iso _TestRNATrancription is UnitTest
  fun name(): String => "rna-transcription/ToRNA"

  fun apply(h: TestHelper) ? =>
    let tests = [
      // rna complement of cytosine is guanine
      ("C", "G")
      // rna complement of guanine is cytosine
      ("G", "C")
      // rna complement of thymine is adenine
      ("T", "A")
      // rna complement of adenine is uracil
      ("A", "U")
      // rna complement
      ("ACGTGGTCTTAA", "UGCACCAGAAUU")
    ]

    for (input, expected) in tests.values() do
      h.assert_eq[String](ToRNA(input)?, expected)
    end

    h.assert_error({() ? => ToRNA("U")? })
    h.assert_error({() ? => ToRNA("ACGTXXXCTTAA")? })
