defmodule AdventOfCode2024.Day01Test do
  use ExUnit.Case

  import AdventOfCode2024.Day01

  test "part1" do
    left = [3, 4, 2, 1, 3, 3]
    right = [4, 3, 5, 3, 9, 3]

    result = part1(left, right)

    assert result == 11
  end

  test "part2" do
    left = [3, 4, 2, 1, 3, 3]
    right = [4, 3, 5, 3, 9, 3]

    result = part2(left, right)

    assert result == 31
  end
end
