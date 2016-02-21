use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestBob)

// TODO: Separate out into TestShout, TestQuestion, etc. for to make more sense.
class _TestBob iso is UnitTest
  """
  Test Bob package
  """
  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): TestResult ? =>
    let shout_resp: String = "Whoa, chill out!"
    let ques_resp: String = "Sure."
    let silent_resp: String = "Fine. Be that way!"
    let default_resp: String = "Whatever."

    h.expect_eq[String](default_resp, Bob("Tom-ay-to, tom-aaaah-to."))
    h.expect_eq[String](shout_resp, Bob("WATCH OUT!"))
    h.expect_eq[String](ques_resp, Bob("Does this cryogenic chamber make me look fat?"))
    h.expect_eq[String](ques_resp, Bob("You are, what, like 15?"))
    h.expect_eq[String](default_resp, Bob("Let's go make out behind the gym!"))
    h.expect_eq[String](default_resp, Bob("It's OK if you don't want to go to the DMV."))
    h.expect_eq[String](shout_resp, Bob("WHAT THE HELL WERE YOU THINKING?"))
    h.expect_eq[String](shout_resp, Bob("1, 2, 3 GO!"))
    h.expect_eq[String](default_resp, Bob("1, 2, 3"))
    h.expect_eq[String](ques_resp, Bob("4?"))
    h.expect_eq[String](shout_resp, Bob("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
    h.expect_eq[String](default_resp, Bob("Ending with ? means a question."))
    h.expect_eq[String](ques_resp, Bob("Wait! Hang on. Are you going to be OK?"))
    h.expect_eq[String](silent_resp, Bob(""))
    h.expect_eq[String](silent_resp, Bob("   "))
