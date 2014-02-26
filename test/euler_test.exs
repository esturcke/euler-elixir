defmodule EulerTest do
  use ExUnit.Case

  test "problem 1", do: assert  233168 == Euler.solve 1
  test "problem 2", do: assert 4613732 == Euler.solve 2
  test "problem 3", do: assert    6857 == Euler.solve 3
  test "problem 4", do: assert  906609 == Euler.solve 4

end
