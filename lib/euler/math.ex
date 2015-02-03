defmodule Euler.Math do

  defmacro div?(n, d) do
    quote do: 0 == rem(unquote(n), unquote(d))
  end

end
