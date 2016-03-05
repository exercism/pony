use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    var test = PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(recover _TestBob end)

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

    h.assert_eq[String](default_resp, Bob("Tom-ay-to, tom-aaaah-to."))
    h.assert_eq[String](shout_resp, Bob("WATCH OUT!"))
    h.assert_eq[String](ques_resp, Bob("Does this cryogenic chamber make me look fat?"))
    h.assert_eq[String](ques_resp, Bob("You are, what, like 15?"))
    h.assert_eq[String](default_resp, Bob("Let's go make out behind the gym!"))
    h.assert_eq[String](default_resp, Bob("It's OK if you don't want to go to the DMV."))
    h.assert_eq[String](shout_resp, Bob("WHAT THE HELL WERE YOU THINKING?"))
    h.assert_eq[String](shout_resp, Bob("1, 2, 3 GO!"))
    h.assert_eq[String](default_resp, Bob("1, 2, 3"))
    h.assert_eq[String](ques_resp, Bob("4?"))
    h.assert_eq[String](shout_resp, Bob("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
    h.assert_eq[String](default_resp, Bob("Ending with ? means a question."))
    h.assert_eq[String](ques_resp, Bob("Wait! Hang on. Are you going to be OK?"))
    h.assert_eq[String](silent_resp, Bob(""))
    h.assert_eq[String](silent_resp, Bob("   "))
