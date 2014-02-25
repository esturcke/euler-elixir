defmodule Euler.Math.Primes do

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
