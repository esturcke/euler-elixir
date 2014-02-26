defmodule Euler.Problem3 do

  @moduledoc """
  # Largest prime factor

  [Problem 3](http://projecteuler.net/problem=3)
  
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?
  """

  import Euler.Math.Factors

  def solve do
    factors(600851475143) |> Enum.at(0)
  end

end
