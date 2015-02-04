defmodule MathTest do
  use ExUnit.Case
  require Euler.Math

  test "div? 5, 2", do: assert  Euler.Math.div?(5, 2) == false
  test "div? 6, 2", do: assert  Euler.Math.div?(6, 2) == true

end
