defmodule Mix.Tasks.Day04 do
  use Mix.Task

  import AdventOfCode2024.Day04

  def run(_args) do
    input =
      File.read!(Path.join(File.cwd!(), "/input/day04.txt"))
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)

    part1(input) |> IO.inspect(label: "Part 1 result")
    part2(input) |> IO.inspect(label: "Part 2 result")
  end
end
