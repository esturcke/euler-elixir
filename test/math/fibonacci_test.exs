defmodule Math.FibonacciTest do
  use ExUnit.Case
  require Euler.Math.Fibonacci

  test "stream", do: assert Euler.Math.Fibonacci.stream |> Enum.take(10) == [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

end
