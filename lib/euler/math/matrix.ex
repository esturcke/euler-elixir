defmodule Math.Matrix do

  defp asInt(i), do: i |> Integer.parse |> elem 0

  defp transpose([], acc), do: acc |> Enum.map(&Enum.reverse/1)
  defp transpose([r|rows], acc), do: transpose(rows, Enum.zip(r, acc) |> Enum.map(fn {x, row} -> [x|row] end)) 
  def transpose([[]]), do: [[]]
  def transpose(m), do: transpose(m, Stream.repeatedly(fn -> [] end) |> Enum.take(Enum.count(hd m)))

  defp horizontals(m, n), do: m |> Enum.flat_map(fn row -> row |> Stream.filter(&(&1 != nil)) |> Enum.chunk(n, 1) end)

  defp verticals(m, n), do: m |> transpose |> horizontals(n)

  defp skew_right(m) do
    m
    |> Stream.with_index
    |> Stream.map(fn {r, i} -> List.duplicate(nil, i) ++ r ++ List.duplicate(nil, length(m) - i - 1) end)
    |> Enum.to_list 
  end

  defp diagonals_up(m, n), do: m |> skew_right |> verticals n 
  defp diagonals_down(m, n), do: m |> Enum.reverse |> diagonals_up n

  def from_string(s) do
    s
    |> String.strip
    |> String.split("\n")
    |> Enum.map(fn row -> row |> String.split |> Enum.map(&asInt/1) end)
  end

  def n_in_a_row(m, n) do
    Enum.concat([
      m |> horizontals(n),
      m |> verticals(n),
      m |> diagonals_down(n),
      m |> diagonals_up(n)
    ])
  end

end
