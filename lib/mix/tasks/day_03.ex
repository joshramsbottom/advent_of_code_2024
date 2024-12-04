defmodule Mix.Tasks.Day03 do
  use Mix.Task

  import AdventOfCode2024.Day03

  def run(_args) do
    input = File.read!(Path.join(File.cwd!(), "/input/day03.txt"))

    part1(input) |> IO.inspect(label: "Part 1 result")
    part2(input) |> IO.inspect(label: "Part 2 result")
  end
end
