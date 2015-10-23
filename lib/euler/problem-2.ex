defmodule Euler.Problem2 do

  @moduledoc """
  # Even Fibonacci numbers

  [Problem 2](http://projecteuler.net/problem=2)

  Each new term in the Fibonacci sequence is generated by adding the previous
  two terms. By starting with 1 and 2, the first 10 terms will be:

    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed
  four million, find the sum of the even-valued terms.
  """

  alias Euler.Math.Fibonacci
  import Integer, only: [is_even: 1]

  def solve do
    Fibonacci.under(4_000_000)
    |> Enum.filter(&is_even/1)
    |> Enum.sum
  end

end
