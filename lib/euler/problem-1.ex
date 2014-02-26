defmodule Euler.Problem1 do

  @moduledoc """
  # Multiples of 3 and 5

  [Problem 1](http://projecteuler.net/problem=1)

  If we list all the natural numbers below 10 that are multiples of 3 or 5,
  we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all
  the multiples of 3 or 5 below 1000.
  """

  def solve do
    1..1000
    |> Enum.reduce 0, fn
      n, acc when 0 == rem n, 3 -> n + acc
      n, acc when 0 == rem n, 5 -> n + acc
      _, acc                    -> acc
    end
  end

end
