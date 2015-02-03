defmodule Euler.Problem6 do

  @moduledoc """
  # Sum square difference

  [Problem 6](http://projecteuler.net/problem=6)

  The sum of the squares of the first ten natural numbers is,

    1² + 2² + ... + 10² = 385

  The square of the sum of the first ten natural numbers is,

    (1 + 2 + ... + 10)² = 552 = 3025
  
  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is `3025 − 385 = 2640`.

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.

  """

  defp square(n), do: n * n
  defp sumSquared(ns), do: ns |> Enum.reduce 0, fn(n, acc) -> acc + square n end
  defp squareSum(ns), do: ns |> Enum.reduce(0, fn(n, acc) -> acc + n end) |> square
  defp sumSquareDiff(ns), do: squareSum(ns) - sumSquared(ns)

  def solve do
    sumSquareDiff 1..100
  end

end
