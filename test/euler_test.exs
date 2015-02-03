defmodule EulerTest do
  use ExUnit.Case

  test "problem 1", do: assert    233168 == Euler.solve 1
  test "problem 2", do: assert   4613732 == Euler.solve 2
  test "problem 3", do: assert      6857 == Euler.solve 3
  test "problem 4", do: assert    906609 == Euler.solve 4
  test "problem 5", do: assert 232792560 == Euler.solve 5
  test "problem 6", do: assert  25164150 == Euler.solve 6
  test "problem 7", do: assert    104743 == Euler.solve 7

end
