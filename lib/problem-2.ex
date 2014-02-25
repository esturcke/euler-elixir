(Stream.unfold {0, 1}, fn {a, b} -> { a + b, { b, a + b } } end)
|> (Enum.take_while fn(n) -> n < 4000000 end)
|> (Enum.filter &(rem(&1, 2) == 0))
|> (Enum.reduce &(&1 + &2))
|> IO.puts
