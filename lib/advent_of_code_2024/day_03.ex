defmodule AdventOfCode2024.Day03 do
  def part1(input) do
    Regex.scan(~r/mul\((?<left>\d{1,3}),(?<right>\d{1,3})\)/, input, capture: :all_but_first)
    |> Enum.reduce(0, fn [left, right], acc ->
      acc + String.to_integer(left) * String.to_integer(right)
    end)
  end

  def part2(input) do
    Regex.scan(~r/(mul\((?<left>\d{1,3}),(?<right>\d{1,3})\))|(?<switch>do(n't)?\(\))/, input,
      capture: :all_names
    )
    |> Enum.reduce({true, 0}, fn instruction, {switch, total} ->
      case instruction do
        [left, right, ""] when switch ->
          {switch, total + String.to_integer(left) * String.to_integer(right)}

        ["", "", flip] when flip == "do()" ->
          {true, total}

        ["", "", flip] when flip == "don't()" ->
          {false, total}

        _ ->
          {switch, total}
      end
    end)
    |> elem(1)
  end
end
