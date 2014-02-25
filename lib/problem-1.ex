1..1000
|> (Enum.reduce 0, fn
  n, acc when 0 == rem n, 3 -> n + acc
  n, acc when 0 == rem n, 5 -> n + acc
  _, acc                    -> acc
end)
|> IO.puts
