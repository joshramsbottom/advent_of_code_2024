defmodule AdventOfCode2024.Day04Test do
  use ExUnit.Case

  import AdventOfCode2024.Day04

  defp input do
    Enum.map(
      [
        "MMMSXXMASM",
        "MSAMXMSMSA",
        "AMXSXMAAMM",
        "MSAMASMSMX",
        "XMASAMXAMM",
        "XXAMMXXAMA",
        "SMSMSASXSS",
        "SAXAMASAAA",
        "MAMMMXMMMM",
        "MXMXAXMASX"
      ],
      &String.graphemes/1
    )
  end

  test "part1" do
    result = part1(input())
    assert result == 18
  end

  test "part2" do
    result = part2(input())
    assert result == 9
  end
end
