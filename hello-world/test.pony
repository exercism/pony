use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    var test = PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(recover _TestHelloWorld end)

class _TestHelloWorld iso is UnitTest
  """
  Test HelloWorld package
  """
  fun name(): String => "hello-world/HelloWorld"

  fun apply(h: TestHelper): TestResult ? =>
    let hello: HelloWorld = HelloWorld.create()

    h.assert_eq[String]("Hello, World!", hello.say_hello())
    h.assert_eq[String]("Hello, Exercism!", hello.say_hello("Exercism"))
    true
