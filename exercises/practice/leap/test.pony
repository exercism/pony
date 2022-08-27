use "pony_test"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestLeap)

class iso _TestLeap is UnitTest
  fun name(): String => "leap/Leap"

  fun apply(h: TestHelper) =>
    // Testing if 1996 is a leap year
    h.assert_true(Leap(1996), "Testing a leap year")
    // Testing if 1997 is a leap year
    h.assert_false(Leap(1997), "Testing an odd year")
    // Testing if 1998 is a leap year
    h.assert_false(Leap(1998), "Testing a non-leap even year")
    // Testing if 1900 is a leap year
    h.assert_false(Leap(1900), "Testing a century")
    // Testing if 2000 is a leap year
    h.assert_true(Leap(2000), "Testing an exceptional century")
