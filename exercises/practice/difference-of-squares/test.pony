use "pony_test"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestSquares)

class iso _TestSquares is UnitTest
  fun name(): String => "difference-of-squares/Squares"

  fun apply(h: TestHelper) =>
    // Square of sums (1 + 2 + … n)²
    h.assert_eq[USize](225, Squares.square_of_sums(5))
    // Sum of squares (1² + 2² + … n²)
    h.assert_eq[USize](55, Squares.sum_of_squares(5))
    // Difference (1 + 2 + … n)² - (1² + 2² + … n²)
    h.assert_eq[USize](170, Squares.difference(5))

    // Square of sums (1 + 2 + … n)²
    h.assert_eq[USize](3025, Squares.square_of_sums(10))
    // Sum of squares (1² + 2² + … n²)
    h.assert_eq[USize](385, Squares.sum_of_squares(10))
    // Difference (1 + 2 + … n)² - (1² + 2² + … n²)
    h.assert_eq[USize](2640, Squares.difference(10))

    // Square of sums (1 + 2 + … n)²
    h.assert_eq[USize](25502500, Squares.square_of_sums(100))
    // Sum of squares (1² + 2² + … n²)
    h.assert_eq[USize](338350, Squares.sum_of_squares(100))
    // Difference (1 + 2 + … n)² - (1² + 2² + … n²)
    h.assert_eq[USize](25164150, Squares.difference(100))

