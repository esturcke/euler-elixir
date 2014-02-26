defmodule Euler do

  @moduledoc """
  This module fetches solutions for a given problem.
  """

  @doc """
  Solve Project Euler problem *n* and return the result.
  """
  def solve n do
    Module.concat(Euler, "Problem#{n}").solve
  end

end
