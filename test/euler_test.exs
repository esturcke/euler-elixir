defmodule EulerTest do
  use ExUnit.Case

  defp md5(n) do
    n |> Integer.to_string |> :erlang.md5 |> Base.encode16 case: :lower
  end

  for line <- File.stream!(Path.join([__DIR__, "solutions.txt"]), [], :line) do
    [n, hash] = line |> String.split(" ") |> Enum.map &String.strip/1
    test "problem #{n}", do: assert unquote(hash) == Euler.solve(unquote(n)) |> md5
  end

end
