defmodule EulerTest do
  use ExUnit.Case

  def md5(n) do
    n |> Integer.to_string |> :erlang.md5 |> Base.encode16 case: :lower
  end

  test "problem 1", do: assert "e1edf9d1967ca96767dcc2b2d6df69f4" == Euler.solve(1) |> md5
  test "problem 2", do: assert "4194eb91842c8e7e6df099ca73c38f28" == Euler.solve(2) |> md5
  test "problem 3", do: assert "94c4dd41f9dddce696557d3717d98d82" == Euler.solve(3) |> md5
  test "problem 4", do: assert "d4cfc27d16ea72a96b83d9bdef6ce2ec" == Euler.solve(4) |> md5
  test "problem 5", do: assert "bc0d0a22a7a46212135ed0ba77d22f3a" == Euler.solve(5) |> md5
  test "problem 6", do: assert "867380888952c39a131fe1d832246ecc" == Euler.solve(6) |> md5
  test "problem 7", do: assert "8c32ab09ec0210af60d392e9b2009560" == Euler.solve(7) |> md5
  test "problem 8", do: assert "0f53ea7949d32ef24f9186207600403c" == Euler.solve(8) |> md5
end
