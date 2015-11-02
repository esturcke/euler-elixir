defmodule Bitvector do

  def init(n, b \\ false), do: :hipe_bifs.bitarray(n, b)
  def set(v, [], _), do: v
  def set(v, [h|t], b), do: v |> set(h, b) |> set(t, b)
  def set(v, i, b), do: v |> :hipe_bifs.bitarray_update(i, b)
  def get(v, i), do: v |> :hipe_bifs.bitarray_sub(i)
  def all(v, b \\ true), do: for i <- 0..8*byte_size(v) - 1, get(v, i) == b, do: i
  def flip(v, []), do: v
  def flip(v, [h|t]), do: v |> flip(h) |> flip(t)
  def flip(v, i), do: v |> set(i, not get(v, i))

  def sum_byte(b, i) when is_number(b) do
    use Bitwise
    (if (b &&& 0x01) > 0, do:     8 * i, else: 0) +
    (if (b &&& 0x02) > 0, do: 1 + 8 * i, else: 0) +
    (if (b &&& 0x04) > 0, do: 2 + 8 * i, else: 0) +
    (if (b &&& 0x08) > 0, do: 3 + 8 * i, else: 0) +
    (if (b &&& 0x10) > 0, do: 4 + 8 * i, else: 0) +
    (if (b &&& 0x20) > 0, do: 5 + 8 * i, else: 0) +
    (if (b &&& 0x40) > 0, do: 6 + 8 * i, else: 0) +
    (if (b &&& 0x80) > 0, do: 7 + 8 * i, else: 0)
  end

  defp sum("", _, acc), do: acc
  defp sum(<<b, rest::binary>>, i, acc), do: sum(rest, i + 1, acc + sum_byte(b, i))
  def sum(v), do: sum(v, 0, 0)

end
