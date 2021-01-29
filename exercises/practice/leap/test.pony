use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestLeap)

class iso _TestLeap is UnitTest
  fun name(): String => "leap/Leap"

  fun apply(h: TestHelper) =>
    h.assert_true(Leap(1996), "Testing a leap year")
    h.assert_false(Leap(1997), "Testing an odd year")
    h.assert_false(Leap(1998), "Testing a non-leap even year")
    h.assert_false(Leap(1900), "Testing a century")
    h.assert_true(Leap(2000), "Testing an exceptional century")
