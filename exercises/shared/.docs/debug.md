# Debug

To help with debugging you can use output to stdout using `env.out.print()`.

If your variable has a reference capability that isn't sendable (as required for env.out.print(), remember you can get a sendable version of your string by clone()ing your string.

For example:

```pony
actor Main
  new create(env: Env) =>
    let a: String ref = recover String end
    a.append("This is not a sendable string")
    env.out.print(a.clone())
```

Alternatively, if you do not have access to Env in your environment, you can use the "debug" module.

