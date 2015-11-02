defmodule BitvectorTest do
  use ExUnit.Case, async: true
  import Bitvector

  test "create length bit vector", do: assert init(0) == ""
  test "create length 1 bit vector", do: assert init(1) == <<0>>
  test "create length 2 bit vector", do: assert init(2) == <<0>>
  test "create length 8 bit vector", do: assert init(8) == <<0>>
  test "create length 9 bit vector", do: assert init(9) == <<0, 0>>
  test "create length 30 bit vector", do: assert init(30) == <<0, 0, 0, 0>>
  test "create length 30 bit vector all true", do: assert init(30, true) == <<255, 255, 255, 255>>

  test "set single bits" do
    assert init(8) |> set(0, true) == <<1>>
    assert init(8) |> set(2, true) == <<4>>
    assert init(8) |> set(7, true) == <<128>>
    assert init(16) |> set(8, true) == <<0, 1>>
  end

  test "set multiple bits" do
    assert init(16) |> set([0, 2, 10], true) == <<5, 4>>
    assert init(16) |> set([0, 2, 10], true) |> set(2, false) == <<1, 4>>
  end

  test "get bits" do
    assert init(16) |> get(3) == false
    assert init(16, true) |> get(12) == true
    assert init(16) |> set([5, 7, 12], true) |> get(7) == true
    assert init(16) |> set([9, 12], true) |> get(5) == false
  end

  test "collecting all" do
    assert init(16) |> set([2, 8, 9, 12, 15], true) |> all == [2, 8, 9, 12, 15]
    assert init(16) |> set([2, 12, 9, 9, 15], true) |> all == [2, 9, 12, 15]
  end

  test "flipping bits" do
    assert init(16) |> flip(2) == <<4, 0>>
    assert init(16) |> flip(2) |> flip(2) == <<0, 0>>
    assert init(16) |> flip([0,1,2,3,4,8,9,12,15]) |> flip([0,8,10,11,12]) == <<30, 142>>
  end

  test "sum" do
    assert init(1) |> sum == 0
    assert init(1) |> flip(0) |> sum == 0
    assert init(2) |> flip(0) |> sum == 0
    assert init(2) |> flip(1) |> sum == 1
    assert init(16) |> flip([0, 5, 6, 7, 9]) |> sum == 27
  end

end
