defmodule Math.Primes.Atkin do

  require Bitvector
  import Math, only: [sq: 1]
  
  defp odds(n), do: 1 |> Stream.iterate(&(&1 + 2)) |> Stream.take_while(&(&1 <= n))
  defp evens(n), do: 2 |> Stream.iterate(&(&1 + 2)) |> Stream.take_while(&(&1 <= n))
  defp sqrt(n), do: n |> :math.sqrt |> trunc

  def to(limit) when limit < 7, do: [2, 3, 5] |> Enum.take_while(&(&1 <= limit))
  def to(limit) do
    sieve = Bitvector.init(limit + 1)

    # Put in candidate primes:
    #   integers which have an odd number of
    #   representations by certain quadratic forms.
    # Algorithm step 3.1:
    #   for n ≤ limit, n ← 4x²+y² where x ∈ {1,2,...} and y ∈ {1,3,...} // all x's odd y's
    #     if n mod 60 ∈ {1,13,17,29,37,41,49,53}:
    #       is_prime(n) ← ¬is_prime(n)   // toggle state
    candidates = for x <- 1..sqrt((limit - 1)/4),
                     y <- odds(sqrt(limit - 4 * sq(x))),
                     n = 4 * sq(x) + sq(y),
                     n <= limit,
                     rem(n, 60) in [1, 13, 17, 29, 37, 41, 49, 53],
                     do: n
    sieve |> Bitvector.flip(candidates)

    # Algorithm step 3.2:
    #   for n ≤ limit, n ← 3x²+y² where x ∈ {1,3,...} and y ∈ {2,4,...} // only odd x's
    #       if n mod 60 ∈ {7,19,31,43}:                                 // and even y's
    #           is_prime(n) ← ¬is_prime(n)   // toggle state
    candidates = for x <- odds(sqrt((limit - 4)/3)),
                     y <- evens(sqrt(limit - 3 * sq(x))),
                     n = 3 * sq(x) + sq(y),
                     n <= limit,
                     rem(n, 60) in [7, 19, 31, 43],
                     do: n
    sieve |> Bitvector.flip(candidates)

    # // Algorithm step 3.3:
    #   for n ≤ limit, n ← 3x²-y² where x ∈ {2,3,...} and y ∈ {x-1,x-3,...,1} //all even/odd
    #       if n mod 60 ∈ {11,23,47,59}:                                   // odd/even combos
    #           is_prime(n) ← ¬is_prime(n)   // toggle state
    candidates = for x <- evens(sqrt((limit/2))),
                     y <- odds(x - 1),
                     n = 3 * sq(x) - sq(y),
                     n <= limit,
                     rem(n, 60) in [11, 23, 47, 59],
                     do: n
    sieve |> Bitvector.flip(candidates)

    candidates = for x <- odds(sqrt((limit/2))),
                     y <- evens(x - 1),
                     n = 3 * sq(x) - sq(y),
                     n <= limit,
                     rem(n, 60) in [11, 23, 47, 59],
                     do: n
    sieve |> Bitvector.flip(candidates)

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
    primes = sieve |> Bitvector.all
    [2, 3, 5 | primes]
  end

end
