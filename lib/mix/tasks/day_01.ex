defmodule Mix.Tasks.Day01 do
  use Mix.Task

  import AdventOfCode2024.Day01

  def run(_args) do
    input =
      File.read!(Path.join(File.cwd!(), "/input/day01.txt"))
      |> String.split("\n")

    {left, right} =
      Enum.reduce(input, {[], []}, fn line, {left, right} ->
        [first, second] = String.split(line)
        {[String.to_integer(first) | left], [String.to_integer(second) | right]}
      end)

    part1(left, right) |> IO.inspect(label: "Part 1 result")

    part2(left, right) |> IO.inspect(label: "Part 2 result")
  end
end
