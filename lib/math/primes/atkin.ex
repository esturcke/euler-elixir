defmodule Math.Primes.Atkin do

  require Bitvector
  import Math, only: [sq: 1]
  
  defp odds(n) when is_number(n), do: 1 |> Stream.iterate(&(&1 + 2)) |> Stream.take_while(&(&1 <= n))
  defp odds, do: 1 |> Stream.iterate(&(&1 + 2))
  defp reverse_odds(n), do: n |> Stream.iterate(&(&1 - 2)) |> Stream.take_while(&(&1 > 0))
  defp evens(n), do: 2 |> Stream.iterate(&(&1 + 2)) |> Stream.take_while(&(&1 <= n))
  defp evens, do: 2 |> Stream.iterate(&(&1 + 2))
  defp reverse_evens(n), do: n |> Stream.iterate(&(&1 - 2)) |> Stream.take_while(&(&1 > 0))
  defp sqrt(n), do: n |> :math.sqrt |> trunc

  defp candidates(limit, f, xs, ys, rems) do
    batches = for chunk <- xs |> Stream.chunk 100, 100, [] do
                Task.async(fn ->
                  for x <- chunk, n <- ys.(x) |> Stream.map(fn y -> f.(x, y) end) |> Stream.take_while(&(&1 <= limit)),
                    rem(n, 60) in rems,
                    do: n
                end )
    end
    Task.async( fn -> batches |> Stream.map(&Task.await/1) |> Stream.concat end)
  end

  defp sieve(limit) when limit < 7 do
    primes = [2, 3, 5] |> Enum.take_while(&(&1 <= limit))
    Bitvector.init(7) |> Bitvector.set(primes, true)
  end

  defp sieve(limit) do
    sieve = Bitvector.init(limit + 1)

    # Put in candidate primes:
    #   integers which have an odd number of
    #   representations by certain quadratic forms.
    # Algorithm step 3.1:
    #   for n ≤ limit, n ← 4x²+y² where x ∈ {1,2,...} and y ∈ {1,3,...} // all x's odd y's
    #     if n mod 60 ∈ {1,13,17,29,37,41,49,53}:
    #       is_prime(n) ← ¬is_prime(n)   // toggle state
    f = fn x, y -> 4 * sq(x) + sq(y) end
    candidates1 = candidates(limit, f, 1..sqrt((limit - 1)/4), fn _ -> odds end, [1, 13, 17, 29, 37, 41, 49, 53])

    # Algorithm step 3.2:
    #   for n ≤ limit, n ← 3x²+y² where x ∈ {1,3,...} and y ∈ {2,4,...} // only odd x's
    #       if n mod 60 ∈ {7,19,31,43}:                                 // and even y's
    #           is_prime(n) ← ¬is_prime(n)   // toggle state
    f = fn x, y -> 3 * sq(x) + sq(y) end
    candidates2 = candidates(limit, f, odds(sqrt((limit - 4)/3)), fn _ -> evens end, [7, 19, 31, 43])

    # // Algorithm step 3.3:
    #   for n ≤ limit, n ← 3x²-y² where x ∈ {2,3,...} and y ∈ {x-1,x-3,...,1} //all even/odd
    #       if n mod 60 ∈ {11,23,47,59}:                                   // odd/even combos
    #           is_prime(n) ← ¬is_prime(n)   // toggle state
    f = fn x, y -> 3 * sq(x) - sq(y) end
    candidates3 = candidates(limit, f, evens(sqrt((limit/2))), fn x -> reverse_odds(x - 1) end, [11, 23, 47, 59])
    candidates4 = candidates(limit, f, odds(sqrt((limit/2))), fn x -> reverse_evens(x - 1) end, [11, 23, 47, 59])

    sieve |> Bitvector.flip(Task.await(candidates1))
    sieve |> Bitvector.flip(Task.await(candidates2))
    sieve |> Bitvector.flip(Task.await(candidates3))
    sieve |> Bitvector.flip(Task.await(candidates4))

    # // Eliminate composites by sieving, only for those occurrences on the wheel:
    #   for n² ≤ limit, n ← 60 × w + x where w ∈ {0,1,...}, x ∈ s, n ≥ 7:
    #       if is_prime(n):
    #           // n is prime, omit multiples of its square; this is sufficient 
    #           // because square-free composites can't get on this list
    #           for c ≤ limit, c ← n² × (60 × w + x) where w ∈ {0,1,...}, x ∈ s:
    #               is_prime(c) ← false
    s = [1, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 49, 53, 59]
    candidates = for x <- s,
                     w <- 0..trunc((:math.sqrt(limit) - x)/60),
                     n = 60 * w + x,
                     n >= 7,
                     sq(n) <= limit,
                     Bitvector.get(sieve, n),
                     do: n
    reject = for n <- candidates,
                 x <- s,
                 w <- 0..trunc(limit/60/sq(n) - x/60),
                 c = sq(n) * (60 * w + x),
                 c <= limit,
                 do: c
    sieve |> Bitvector.set(reject, false)

    # // one sweep to produce a sequential list of primes up to limit:
    #   output 2, 3, 5
    #   for 7 ≤ n ≤ limit, n ← 60 × w + x where w ∈ {0,1,...}, x ∈ s:
    #       if is_prime(n): output n
    sieve |> Bitvector.set [2, 3, 5], true
  end

  def to(limit), do: sieve(limit) |> Bitvector.all

  def sum_to(limit), do: sieve(limit) |> Bitvector.sum

end
