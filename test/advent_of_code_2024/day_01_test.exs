defmodule AdventOfCode2024.Day01Test do
  use ExUnit.Case

  import AdventOfCode2024.Day01

  defp left do
    [3, 4, 2, 1, 3, 3]
  end

  defp right do
    [4, 3, 5, 3, 9, 3]
  end

  test "part1" do
    result = part1(left(), right())

    assert result == 11
  end

  test "part2" do
    result = part2(left(), right())

    assert result == 31
  end
end
