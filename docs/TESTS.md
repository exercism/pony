To run Pony's built in [Unit Testing framework](https://github.com/ponylang/ponyc/blob/master/packages/ponytest/ponytest.pony#L26), simply compile your package code, in your exercise directory with

```
ponyc
```
Then run the executable for your package, in this example, our package is in the __hello-world__ directory.

```
./hello-world
```

The output should look similar to:

```
1 test started, 0 complete: hello-world/HelloWorld started
1 test started, 1 complete: hello-world/HelloWorld complete
---- Passed: hello-world/HelloWorld
----
---- 1 test ran.
---- Passed: 1
```

The current pattern is to put the test code directly in the packages under test. Then use the package's Main Actor to run the tests. We can see that pattern exemplified in __tests.pony__:

 ```
actor Main is TestList
  new create(env: Env) =>
    var test = PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestHelloWorld)
 ```

