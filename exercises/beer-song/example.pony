use "collections"
use "itertools"

primitive BeerSong
  fun verse(n: USize): String =>
    match n
    | 0 => 
      """
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      """
    | 1 =>
      """
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      """
    | 2 => 
      """
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.
      """
    else
      let ns: String = n.string()
      let ns': String = (n - 1).string()
      recover String
        .> append(ns)
        .> append(" bottles of beer on the wall, ")
        .> append(ns)
        .> append(" bottles of beer.\nTake one down and pass it around, ")
        .> append(ns')
        .> append(" bottles of beer on the wall.\n")
      end
    end

  fun sing(start: USize, stop: USize): String iso^ =>
    try
      String.join(
        Iter[USize](Reverse(start, stop))
          .map[String]({(n: USize): String => BeerSong.verse(n) + "\n" })
          .collect(Array[String](start - stop))
          .values())
        .> pop()?
    else
      recover String end
    end
