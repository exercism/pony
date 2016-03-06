use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestSquares)

class _TestSquares iso is UnitTest
  """
  Test Difference of Squares package
  """

  fun name(): String => "difference-of-squares/Squares"

  fun apply(h: TestHelper): TestResult =>
    h.expect_eq[U32](225, Squares(5).square_of_sums())
    h.expect_eq[U32](55, Squares(5).sum_of_squares())
    h.expect_eq[U32](170, Squares(5).difference())

    h.expect_eq[U32](3025, Squares(10).square_of_sums())
    h.expect_eq[U32](385, Squares(10).sum_of_squares())
    h.expect_eq[U32](2640, Squares(10).difference())

    h.expect_eq[U32](25502500, Squares(100).square_of_sums())
    h.expect_eq[U32](338350, Squares(100).sum_of_squares())
    h.expect_eq[U32](25164150, Squares(100).difference())
