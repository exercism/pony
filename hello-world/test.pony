use "ponytest"

actor Main
  new create(env: Env) =>
    var test = PonyTest(env)

    test(recover _TestHelloWorld end)

    test.complete()

class _TestHelloWorld iso is UnitTest
  """
  Test HelloWorld package
  """
  fun name(): String => "hello-world/HelloWorld"

  fun apply(h: TestHelper): TestResult =>
    let hello: HelloWorld = HelloWorld.create()

    h.expect_eq[String]("Hello, World!", hello.say_hello())
    h.expect_eq[String]("Hello, Exercism!", hello.say_hello("Exercism!"))
    true
