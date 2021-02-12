primitive Leap
  fun apply(year: USize): Bool =>
    let has_factor = {(n: USize)(year): Bool => (year % n) == 0 }
    has_factor(4) and (not has_factor(100) or has_factor(400))
