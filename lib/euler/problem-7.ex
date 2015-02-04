defmodule Euler.Problem7 do

  @moduledoc """
  # 10001st prime 

  [Problem 7](http://projecteuler.net/problem=7)

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  What is the 10 001st prime number?
  """

  import Euler.Math.Primes

  def solve do
    primes |> Enum.at 10000
  end

end
