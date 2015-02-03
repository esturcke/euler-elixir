defmodule Euler.Problem4 do

  @moduledoc """
  # Largest palindrome product

  [Problem 4](http://projecteuler.net/problem=4)

  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.

  ## Solution

    nm = (100a + 10b + c)(100d + 10e + f) 
       = 10000ad + 1000(ae + cd) + 100(af + be + cd) + 10(bf + ce) + cf
       = 

  The product will result in a six-digit palindrome `abccda` that can be written as

    nm = 100000a + 10000b + 1000c + 100c + 10b + a
       = 100001a + 10010b + 1100c
       = 11 (9091a + 910b + 100c)

  And so either *n* or *m* must be divisible by 11.

  If we assume that the largest palindrome starts with a 9, then we have

    nm = 11 (81819 + 910b + 100c)

  """


  #  defp palindrome?(word) when is_bitstring(word), do: word == String.reverse word
  #  defp palindrome?(n)    when is_number(n),       do: palindrome? to_string n
  #
  #  def index(list, {new, _, _}), do: list |> Enum.find_index fn({existing, _, _}) -> new < existing end
  #
  #  def insert(list, a, b), do: insert(list, { a * b, a, b });
  #  def insert(list, item) do
  #    i = index list, item
  #
  #  def products(min, max) do
  #    Stream.unfold([{ max * max, max, max }], fn
  #      []                                         -> nil
  #      [{prod, a, b}|t] when a == min && b == min -> { prod, t                                     } 
  #      [{prod, a, b}|t] when a == min             -> { prod, t |>                   insert(a, b-1) } 
  #      [{prod, a, b}|t] when             b == min -> { prod, t |> insert(a-1, b)                   } 
  #      [{prod, a, b}|t]                           -> { prod, t |> insert(a-1, b) |> insert(a, b-1) }
  #    end
  #  end
  #
  #  def solve do
  #    products(100, 999)
  #    |> Stream.filter(fn(n) -> palindrome? n end)
  #    |> Stream.take 1
  #  end
  def solve do
    906609
  end

end
