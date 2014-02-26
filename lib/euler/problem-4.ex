defmodule Problem4 do

  defp isPalindrome(n), do: to_string n == String.reverse to_string n

  defp merge(a, b) do
    cond do
      Enum.empty? a -> b
      Enum.empty? b -> a
      true          -> (
        x  = a |> Enum.at 0
        y  = b |> Enum.at 0
        xs = a |> Stram.drop 1
        ys = b |> Stram.drop 1
        if x > y do
          Stream.concat([x], merge(xs, b))
        else
          Stream.concat([y], merge(a, ys))
        end
      )
    end
  end

  defp products(a, b) do
    0
  end

  def solve do
    0
  end

end
