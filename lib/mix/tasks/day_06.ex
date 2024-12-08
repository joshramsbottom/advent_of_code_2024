defmodule Mix.Tasks.Day06 do
  use Mix.Task

  import AdventOfCode2024.Day06

  def run(_args) do
    input =
      File.read!(Path.join(File.cwd!(), "/input/day06.txt"))
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)

    part1(input) |> IO.inspect(label: "Part 1 result")
  end
end
