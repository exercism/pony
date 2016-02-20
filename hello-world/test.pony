use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestHelloWorld)

class _TestHelloWorld iso is UnitTest
  """
  Test HelloWorld package
  """
  fun name(): String => "hello-world/HelloWorld"

  fun apply(h: TestHelper) : TestResult =>
    let hello: HelloWorld = HelloWorld.create()

    h.expect_eq[String]("Hello, World!", hello.say_hello())
    h.expect_eq[String]("Hello, Exercism!", hello.say_hello("Exercism!"))
    true
