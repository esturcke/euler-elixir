defmodule Euler.Math do

  defmacro div?(n, d) do
    quote do: 0 == rem(unquote(n), unquote(d))
  end

  defmacro between?(n, a, b) do
    quote do: unquote(a) <= unquote(n) and unquote(n) <= unquote(b)
  end

end
