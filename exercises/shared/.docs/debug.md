# Debug

As the current test-runner utilizes [PonyTest](https://stdlib.ponylang.io/pony_test--index/), the Main actor is in test.pony and shouldn't be editted as a part of your solution.

As is best practice in Pony applications, we do not provide access to `Env` unless needed.  This means that in almost all cases, you are unable to use printf-style debugging using `env.out.print()`.

However, Pony has a [debug](https://stdlib.ponylang.io/debug--index/) module which allows programs that are compiled with the `-d` flag to have special access to STDOUT and STDERR without access to `Env`.

If you need printf-style debugging, you should use this functionality.

Debug Example:

```pony
use "debug"

actor Main
  new create(env: Env) =>
    MySolution.examplefn("First String", 42)

primitive MySolution
  fun examplefn(arg1: String, arg2: USize) =>
    Debug.out("arg1: " + arg1 + ", arg2: " + arg2.string() + " were provided to MySolution.examplefn()")
```


The same code compiled with and without the `-d` flag:

```text
[red@apophenia:~/debug_example]$ ponyc -d
Generating
 Reachability
 Selector painting
 Data prototypes
 Data types
 Function prototypes
 Functions
 Descriptors
Writing ./debug_example.o
Linking ./debug_example

[red@apophenia:~/debug_example]$ ./debug_example 
arg1: First String, arg2: 42 were provided to MySolution.examplefn()

[red@apophenia:~/debug_example]$ ponyc
Generating
 Reachability
 Selector painting
 Data prototypes
 Data types
 Function prototypes
 Functions
 Descriptors
Optimising
Writing ./debug_example.o
Linking ./debug_example

[red@apophenia:~/debug_example]$ ./debug_example 
[red@apophenia:~/debug_example]$ 
```

