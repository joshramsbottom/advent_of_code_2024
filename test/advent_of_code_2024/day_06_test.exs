defmodule AdventOfCode2024.Day06Test do
  use ExUnit.Case

  import AdventOfCode2024.Day06

  test "part" do
    input =
      [
        "....#.....",
        ".........#",
        "..........",
        "..#.......",
        ".......#..",
        "..........",
        ".#..^.....",
        "........#.",
        "#.........",
        "......#..."
      ]
      |> Enum.map(&String.graphemes/1)

    result = part1(input)
    assert result == 41
  end
end
