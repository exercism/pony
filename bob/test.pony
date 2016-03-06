use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_BobShoutTest)
    test(_BobQuestionTest)
    test(_BobSilentTest)
    test(_BobDefaultTest)

class _BobShoutTest iso is UnitTest
  """
  Test matching when Bob is shouted at
  """
  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): TestResult ? =>
    let shout_resp: String = "Whoa, chill out!"

    h.expect_eq[String](shout_resp, Bob("WATCH OUT!"))
    h.expect_eq[String](shout_resp, Bob("WHAT THE HELL WERE YOU THINKING?"))
    h.expect_eq[String](shout_resp, Bob("1, 2, 3 GO!"))
    h.expect_eq[String](shout_resp, Bob("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))

class _BobQuestionTest iso is UnitTest
  """
  Test matching when Bob is questioned
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): TestResult ? =>
    let ques_resp: String = "Sure."

    h.expect_eq[String](ques_resp, Bob("Does this cryogenic chamber make me look fat?"))
    h.expect_eq[String](ques_resp, Bob("You are, what, like 15?"))
    h.expect_eq[String](ques_resp, Bob("4?"))
    h.expect_eq[String](ques_resp, Bob("Wait! Hang on. Are you going to be OK?"))

class _BobSilentTest iso is UnitTest
  """
  Test matching when Bob faces silence
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): TestResult ? =>
    let silent_resp: String = "Fine. Be that way!"

    h.expect_eq[String](silent_resp, Bob(""))
    h.expect_eq[String](silent_resp, Bob("   "))

class _BobDefaultTest iso is UnitTest
  """
  Test matching when Bob is defaulting
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): TestResult ? =>
    let default_resp: String = "Whatever."

    h.expect_eq[String](default_resp, Bob("Tom-ay-to, tom-aaaah-to."))
    h.expect_eq[String](default_resp, Bob("Let's go make out behind the gym!"))
    h.expect_eq[String](default_resp, Bob("It's OK if you don't want to go to the DMV."))
    h.expect_eq[String](default_resp, Bob("1, 2, 3"))
    h.expect_eq[String](default_resp, Bob("Ending with ? means a question."))
