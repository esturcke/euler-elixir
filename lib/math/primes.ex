defmodule Math.Primes do

  import Math, only: [div?: 2]
  require Math.Primes.Atkin

  defp isPrime(n) do
    sqrt = n |> :math.sqrt |> trunc
    hasFactor = 
      primes
      |> Stream.take_while(&(&1 <= sqrt))
      |> Enum.any?(&div?(n, &1))
    not hasFactor
  end

  def primes do
    import Math.Primes.List
    odds = Stream.iterate max + 2, &(&1 + 2)
    Stream.concat(list, odds |> Stream.filter &isPrime/1)
  end

  def take(n) when is_integer(n), do: primes |> Enum.take(n)

  def to(n), do: Math.Primes.Atkin.to(n)

  def sum_to(n), do: Math.Primes.Atkin.sum_to(n)

end
