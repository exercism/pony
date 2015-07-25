use "ponytest"


actor Main

  new create(env: Env) =>
    var test = PonyTest(env)

    test(recover _LeapTest end)

    test.complete()


class _LeapTest iso is UnitTest

  fun name(): String => "leap/Leap"

  fun apply(h: TestHelper): TestResult =>
    h.expect_true(Leap(1996), "Testing a leap year")
    h.expect_false(Leap(1997), "Testing an odd year")
    h.expect_false(Leap(1998), "Testing a non-leap even year")
    h.expect_false(Leap(1900), "Testing a century")
    h.expect_true(Leap(2000), "Testing an exceptional century")
