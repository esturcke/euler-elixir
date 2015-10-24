defmodule Euler.Math.Factors do

  import Euler.Math.Primes

  defp find(n,  l, acc \\ [])
  defp find(_, [], acc), do: acc
  defp find(1,  _, acc), do: acc
  defp find(n,  l, acc) do
    l2 = l |> Stream.drop_while &(rem(n, &1) != 0)
    d  = l2 |> Enum.at 0
    find(div(n, d), l2, [d|acc])
  end

  def factors(n) do
    sqrt = n |> :math.sqrt |> trunc
    if sqrt <= Euler.Math.Primes.List.max do
      find(n, Euler.Math.Primes.List.list)
    else
      find(n, primes)
    end
  end

end
