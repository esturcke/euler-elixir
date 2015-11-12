defmodule Math.MatrixTest do
  use ExUnit.Case, async: true
  import Math.Matrix

  test "string to matrix" do
    assert """

    """
    |> from_string == [[]]
    
    assert "" |> from_string == [[]]

    assert """
    1
    """
    |> from_string == [[1]]
    
    assert """
    1
    2
    3
    """
    |> from_string == [[1], [2], [3]]
    
    assert """
    1 2 3
    """
    |> from_string == [[1, 2, 3]]

    assert """
    1 2 3
    4 5 6
    7 8 9
    """
    |> from_string == [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  test "transpose" do
    assert [[]] |> transpose == [[]]
    assert [[1, 2, 3]] |> transpose == [[1], [2], [3]]
    
    m = """
    1 2 4 5
    2 3 4 5
    9 9 9 9
    """ |> from_string
    assert m |> transpose |> transpose == m

  end

  test "" do
    assert """
    1 2 3 4
    4 5 6 7
    7 8 9 0
    0 1 2 3
    """
    |> from_string
    |> n_in_a_row(2)
    |> Enum.map(&Enum.sort/1)
    |> Enum.sort
    |> Enum.uniq
    == 
    [
      [1, 2], [2, 3], [3, 4],
      [4, 5], [5, 6], [6, 7],
      [7, 8], [8, 9], [9, 0],
      [0, 1], [1, 2], [2, 3],
      [1, 4], [4, 7], [7, 0],
      [2, 5], [5, 8], [8, 1],
      [3, 6], [6, 9], [9, 2],
      [4, 7], [7, 0], [0, 3],
      [1, 5], [2, 6], [3, 7],
      [4, 8], [5, 9], [6, 0],
      [7, 1], [8, 2], [9, 3],
      [2, 4], [3, 5], [4, 6],
      [5, 7], [6, 8], [7, 9],
      [8, 0], [9, 1], [0, 2]
    ]
    |> Enum.map(&Enum.sort/1)
    |> Enum.sort
    |> Enum.uniq
  end
end
