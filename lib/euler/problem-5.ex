defmodule Euler.Problem5 do

  @moduledoc """
  # Smallest multiple

  [Problem 5](http://projecteuler.net/problem=5)

  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?

  ## Solution


  """

   defp gcd(0, b), do: b
   defp gcd(a, b), do: gcd(rem(b, a), a)

   defp smallestDiv(n), do: 1..n |> Enum.reduce 1, fn(a, b) -> div a * b, gcd(a, b) end

   def solve do
     smallestDiv 20
   end

end
