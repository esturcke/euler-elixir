defmodule MathTest do
  use ExUnit.Case
  import Math

  test "div? 5, 2", do: assert div?(5, 2) == false
  test "div? 6, 2", do: assert div?(6, 2) == true

end
