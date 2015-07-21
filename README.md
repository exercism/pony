# xPony

Exercism problems in Pony.

## Setup

First, install [ponyc](https://github.com/CausalityLtd/ponyc).

There's a tutorial and sandbox for playing with Pony at [ponylang.org](http://ponylang.org)

NB `ponyc` will not work without Unicode support for PCRE, available
starting in libpcre 10.10. Most OSs ship with libpcre 8.x, so you'll
probably need to download and compile the latest [PCRE](http://pcre.org/)

(You can do this after installing ponyc, it's okay.)

Then write your example and the test using [ponytest](https://github.com/CausalityLtd/ponyc/tree/master/packages/ponytest).

The `ponyc` compiler doesn't care what your files are called, so you can just
call your example `example.pony`; the Main actor will be in the test file,
so it's all good.

## Running tests

Run `ponyc` in your exercise directory. if it compiles, you did something right.

The compiled binary, `./exercise-name` runs the tests in its Main actor, so
just run the binary and see if your tests passed.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## License

The MIT License (MIT)

Copyright (c) 2015 Katrina Owen, _@kytrinyx.com
