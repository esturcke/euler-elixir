defmodule Math.Primes do

  defp isPrime(n) do
    not (
      primes
      |> Stream.take_while(&(&1 * &1 <= n))
      |> Enum.any?(&(rem(n, &1) == 0))
    )
  end

  def primes do
    odds = Stream.iterate 5, &(&1 + 2)
    Stream.concat(2..3, odds |> Stream.filter &(isPrime(&1)))
  end

  def take(n) when is_integer(n), do: primes |> Enum.take(n)

end

defmodule Factors do

  import Primes

  defp find(n,  l, acc \\ [])
  defp find(_, [], acc), do: acc
  defp find(1,  _, acc), do: acc
  defp find(n,  l, acc) do
    l2 = l |> Stream.drop_while &(rem(n, &1) != 0)
    d  = l2 |> Enum.at 0
    find(div(n, d), l2, [d|acc])
  end

  def factors(n) do
    find(n, primes)
  end

end
