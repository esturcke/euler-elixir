defmodule Euler.Problem1 do

  @moduledoc """
  # Multiples of 3 and 5

  [Problem 1](http://projecteuler.net/problem=1)

  If we list all the natural numbers below 10 that are multiples of 3 or 5,
  we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all
  the multiples of 3 or 5 below 1000.
  """

  import Euler.Math, only: [div?: 2]

  def solve do
    1..999
    |> Enum.filter(&(div?(&1, 3) or div?(&1, 5)))
    |> Enum.sum
  end

end
