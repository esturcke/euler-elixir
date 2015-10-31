defmodule AtkinTest do
  use ExUnit.Case, async: true
  import Math.Primes.Atkin

  test "small primes" do
    assert to(1) == []
    assert to(2) == [2]
    assert to(6) == [2, 3, 5]
    assert to(11) == [2, 3, 5, 7, 11]
    assert to(12) == [2, 3, 5, 7, 11]
  end

  test "vs static list" do
    import Math.Primes.List
    assert to(max) == list 
  end
end
