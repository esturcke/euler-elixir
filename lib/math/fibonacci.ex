defmodule Math.Fibonacci do

  def stream do
    {0, 1} |> Stream.unfold fn {a, b} -> {a + b, {b, a + b}} end
  end

  def under(n) do
    stream |> Enum.take_while &(&1 < n)
  end

end
