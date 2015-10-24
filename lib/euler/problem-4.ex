defmodule Euler.Problem4 do

  @moduledoc """
  # Largest palindrome product

  [Problem 4](http://projecteuler.net/problem=4)

  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.

  ## Solution

  The product will result in a six-digit palindrome `abccda` that can be written as

    mn = 100000a + 10000b + 1000c + 100c + 10b + a
       = 100001a + 10010b + 1100c
       = 11 (9091a + 910b + 100c)

  If we assume that the largest palindrome starts with a 9, then we have

    mn = 11 (81819 + 910b + 100c)

  Also, either *n* or *m* must be divisible by 11. Let's say *n*. Then if
  *n'* = *n*/11,

    mn' = 81819 + 910b + 100c = f(b, c)

  where

    n' ∈ 10..90
    m  ∈ 100..999
    b  ∈ 0..9
    c  ∈ 0..9

  so we can search over b, c and n' such that

    (81819 + 910b + 100c)/n' ∈ 100..999

  """

  import Euler.Math, only: [div?: 2, between?: 3]

  defp f(b, c), do: 81819 + 910 * b + 100 * c

  def solve do
    solutions =
      for b <- 9..0,
          c <- 9..0,
          n <- 90..10,
          f = f(b, c),
          div?(f, n),
          between?(f/n, 100, 999),
          do: f * 11
    solutions |> List.first
  end

end
