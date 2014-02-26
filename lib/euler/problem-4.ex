defmodule Euler.Problem4 do

  @moduledoc """
  # Largest palindrome product

  [Problem 4](http://projecteuler.net/problem=4)

  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  defp isPalindrome(n), do: to_string n == String.reverse to_string n

  defp merge(a, b) do
    cond do
      Enum.empty? a -> b
      Enum.empty? b -> a
      true          -> (
        x  = a |> Enum.at 0
        y  = b |> Enum.at 0
        xs = a |> Stram.drop 1
        ys = b |> Stram.drop 1
        if x > y do
          Stream.concat([x], merge(xs, b))
        else
          Stream.concat([y], merge(a, ys))
        end
      )
    end
  end

  defp products(a, b) do
    0
  end

  def solve do
    0
  end

end
