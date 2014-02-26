defmodule Problem3 do

  import Euler.Math.Factors

  def solve do
    factors(600851475143) |> Enum.at(0)
  end

end
