defmodule Timer do
  import Float, only: [round: 2]
  def start, do: :erlang.system_time
  def delta(t, label) do
    dt = :erlang.system_time - t
    IO.puts("#{round(dt/1_000_000, 2)}ms (#{label})")
    t + dt
  end
end
