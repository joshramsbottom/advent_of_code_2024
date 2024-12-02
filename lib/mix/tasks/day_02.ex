defmodule Mix.Tasks.Day02 do
  use Mix.Task

  import AdventOfCode2024.Day02

  def run(_args) do
    input =
      File.read!(Path.join(File.cwd!(), "/input/day02.txt"))
      |> String.split("\n")

    part1(input) |> IO.inspect(label: "Part 1 result")
    part2(input) |> IO.inspect(label: "Part 2 result")
  end
end
