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

end
