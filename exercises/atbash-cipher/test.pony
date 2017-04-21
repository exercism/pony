use "ponytest"

actor Main is TestList
  new create(env: Env) => 
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestAtbashEncode)
    test(_TestAtbashDecode)

class iso _TestAtbashEncode is UnitTest
  fun name(): String => "atbash-cipher/Atbash.encode"

  fun apply(h: TestHelper) =>
    let tests = [
      ("yes",
        "bvh")
      ("no",
        "ml")
      ("OMG",
        "lnt")
      ("O M G",
        "lnt")
      ("mindblowingly",
        "nrmwy oldrm tob")
      ("Testing,1 2 3, testing.",
        "gvhgr mt123 gvhgr mt")
      ("Truth is fiction.",
        "gifgs rhurx grlm")
      ("The quick brown fox jumps over the lazy dog.",
        "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
    ]
    for (input, expected) in tests.values() do
      h.assert_eq[String](Atbash.encode(input), expected)
    end

class iso _TestAtbashDecode is UnitTest
  fun name(): String => "atbash-cipher/Atbash.decode"

  fun apply(h: TestHelper) =>
    let tests = [
      ("vcvix rhn",
        "exercism")
      ("zmlyh gzxov rhlug vmzhg vkkrm thglm v",
        "anobstacleisoftenasteppingstone")
      ("gvhgr mt123 gvhgr mt",
        "testing123testing")
      ("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
        "thequickbrownfoxjumpsoverthelazydog")
    ]
    for (input, expected) in tests.values() do
      h.assert_eq[String](Atbash.decode(input), expected)
    end
