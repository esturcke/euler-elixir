defmodule Euler.Problem9 do

  @moduledoc """
  # Special Pythagorean triplet

  [Problem 9](http://projecteuler.net/problem=9)

  A Pythagorean triplet is a set of three natural numbers, *a* < *b* < *c*, for which,
  
    *a*² + *b*² = *c*²

  For example, 3² + 4² = 9 + 16 = 25 = 5².
  
  There exists exactly one Pythagorean triplet for which *a* + *b* + *c* = 1000.
  Find the product *abc*.

  ## Solution

  This is a brute force solution.
  """

  import Math, only: [sq: 1]

  defp triplet?(a, b, c), do: sq(a) + sq(b) == sq(c)

  def solve do
    products =
      for a <- 1..333,
          b <- a + 1..div(1000 - a, 2),
          c = 1000 - a - b,
          triplet?(a, b, c),
          do: a * b * c
    products |> List.first
  end

end
