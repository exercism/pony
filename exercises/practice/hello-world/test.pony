use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestHelloWorld)

class iso _TestHelloWorld is UnitTest
  fun name(): String => "hello-world/HelloWorld"

  fun apply(h: TestHelper) =>
    h.assert_eq[String]("Hello, World!", HelloWorld.hello())
