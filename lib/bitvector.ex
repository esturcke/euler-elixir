defmodule Bitvector do

  def init(n, b \\ false), do: :hipe_bifs.bitarray(n, b)
  def set(v, i, b) when is_number(i), do: v |> :hipe_bifs.bitarray_update(i, b)
  def set(v, is, b) do
    for i <- is, do: set(v, i, b)
    v
  end
  def get(v, i), do: v |> :hipe_bifs.bitarray_sub(i)
  def all(v, b \\ true), do: for i <- 0..8*byte_size(v) - 1, get(v, i) == b, do: i
  def flip(v, i) when is_number(i), do: v |> set(i, not get(v, i))
  def flip(v, is) do
    for i <- is, do: flip(v, i)
    v
  end

  defp sum_byte(b, i) when is_number(b) do
    use Bitwise
    (if (b &&& 0x01) > 0, do:     i, else: 0) +
    (if (b &&& 0x02) > 0, do: 1 + i, else: 0) +
    (if (b &&& 0x04) > 0, do: 2 + i, else: 0) +
    (if (b &&& 0x08) > 0, do: 3 + i, else: 0) +
    (if (b &&& 0x10) > 0, do: 4 + i, else: 0) +
    (if (b &&& 0x20) > 0, do: 5 + i, else: 0) +
    (if (b &&& 0x40) > 0, do: 6 + i, else: 0) +
    (if (b &&& 0x80) > 0, do: 7 + i, else: 0)
  end

  defp sum("", _, acc), do: acc
  defp sum(<<b, rest::binary>>, i, acc), do: sum(rest, i + 1, acc + sum_byte(b, 8 * i))
  def sum(v), do: sum(v, 0, 0)

end
