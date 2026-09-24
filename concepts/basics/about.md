# About

- Pony is statically typed. This means that you *must* define the types of data
  in your programs in advance. If you tell pony that the variable `x` is an
  integer, you can't assign a string to it.
- Pony's type-system is what enables Pony's guarantees.
  - If your program compiles, it won't crash.
  - There will never be an unhandled exception.
  - There is no such thing as `null`, so your program will never try and
    dereference `null`.
  - There will never be a data-race.
  - There will never be a deadlock.
  - Your code will always be capabilities secure (protection from supply-chain
    attacks.
- Pony does not allow you to cast types. All type changes must occur through
  a function that creates a new instance of the new type.
- Pony's type-system is different from most every other language, so we're
  going to cover it in bite-sized chunks.

## Primitives

- Primitives are the simplest form of code organization in Pony.
  - You can think of it as a container, or namespace for functions.
  - It has no fields (we have classes for that).
  - It is defined with the `primitive` keyword.

## Functions

- Functions are defined with the `fun` keyword.
  - Functions must live in a `primitive` (or a `class` or an `actor`),
    but they'll come later).
  - Functions may have arguments going in, a return value. They must be typed.
  - If you define a return type, your function *must* return a value of that
      type. Pony does not have the concept of Null.

```pony
primitive Greeter
  // A Function that takes a String, and returns a different String
  fun hello(name: String): String =>
    "Hello " + name + "!"
```

## Comments

Comments can be used to leave notes, reminders, or just temporarily remove
code from the source-code. As you've already seen above, single line comments
use `//`. Multi-line comments use C-style `/*` and `*/`.

## Variables

- Variables always start with a lower-case letter
  - We will declare them using `var`. (`let` and `embed` come later).
  - If Pony can determine the variable type it will do it for you.
  - The type of the variable is checked at compile-time and can never change.
  - When starting with Pony, we recommend being explicit with the type.

```pony
var name: "Bob"
var bettername: String = "Bobby"
```
