defmodule Mix.Tasks.Day05 do
  use Mix.Task

  import AdventOfCode2024.Day05

  def run(_args) do
    [rules, updates] =
      File.read!(Path.join(File.cwd!(), "/input/day05.txt"))
      |> String.split("\n\n", parts: 2)

    part1(String.split(rules, "\n"), String.split(updates, "\n"))
    |> IO.inspect(label: "Part 1 result")

    part2(String.split(rules, "\n"), String.split(updates, "\n"))
    |> IO.inspect(label: "Part 2 result")
  end
end
