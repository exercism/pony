class HelloWorld

  let hello: String

  new create() =>
    hello  = "Hello, "

  fun say_hello(who: String = "World!"): String =>
    hello.add(who)
