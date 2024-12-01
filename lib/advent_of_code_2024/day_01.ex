defmodule AdventOfCode2024.Day01 do
  def part1(left, right) do
    sorted_left = Enum.sort(left, :asc)
    sorted_right = Enum.sort(right, :asc)

    Enum.zip_reduce(sorted_left, sorted_right, 0, fn x, y, acc -> abs(x - y) + acc end)
  end

  def part2(left, right) do
    map =
      Enum.reduce(left, %{}, fn num, map ->
        Map.update(map, num, "l", fn current_value -> current_value <> "l" end)
      end)

    Enum.reduce(right, map, fn num, map ->
      Map.update(map, num, "r", fn current_value -> current_value <> "r" end)
    end)
    |> Enum.reduce(0, fn {num, counts}, acc ->
      acc + num * count_char(counts, "l") * count_char(counts, "r")
    end)
  end

  defp count_char(string, char) do
    string
    |> String.graphemes()
    |> Enum.count(fn c -> c == char end)
  end
end
