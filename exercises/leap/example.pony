class Leap

  fun apply(year: U32): Bool =>
    if (year % 400) == 0 then
      true
    elseif ((year % 100) != 0) and ((year % 4) == 0) then
      true
    else
      false
    end
