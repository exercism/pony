use "collections"
use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestPascalsTriangle)

class iso _TestPascalsTriangle is UnitTest
  fun name(): String => "pascals-triangle"

  fun apply(h: TestHelper) ? =>
    assert_rows_eq(h, 0, Array[Array[USize]])?
    assert_rows_eq(h, 1, [[1]])?
    assert_rows_eq(h, 2, [[1]; [1; 1]])?
    assert_rows_eq(h, 3, [[1]; [1; 1]; [1; 2; 1]])?
    assert_rows_eq(h, 4, [[1]; [1; 1]; [1; 2; 1]; [1; 3; 3; 1]])?

  fun assert_rows_eq(
    h: TestHelper,
    count: USize,
    expected: Array[Array[USize]],
    loc: SourceLoc = __loc)
  ? =>
    let t = PascalsTriangle.rows(count)
    h.assert_eq[USize](t.size(), expected.size())
    for i in Range(0, expected.size()) do
      h.assert_array_eq[USize](expected(i)?, t(i)?)
    end
