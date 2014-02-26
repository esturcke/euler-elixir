defmodule EulerTest do
  use ExUnit.Case

  defp solutions, do: [
    { 1,  233168 },
    { 2, 4613732 },
    { 3,    6857 },
    { 4,  906609 },
  ]

  test "solutions" do
    Enum.each solutions, fn { n, solution } -> assert((solution == Euler.solve n), "Problem #{n}") end
  end

end
