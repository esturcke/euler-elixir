defmodule Euler.Math.Fibonacci do

  def stream do
    {0, 1} |> Stream.unfold fn {a, b} -> {a + b, {b, a + b}} end
  end

end
