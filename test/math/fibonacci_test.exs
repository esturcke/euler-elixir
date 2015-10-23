defmodule Math.FibonacciTest do
  use ExUnit.Case
  import Euler.Math.Fibonacci

  test "stream", do: assert stream |> Enum.take(10) == [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
  test "under 8", do: assert under(8) == [1, 2, 3, 5]
  test "under 9", do: assert under(9) == [1, 2, 3, 5, 8]

end
