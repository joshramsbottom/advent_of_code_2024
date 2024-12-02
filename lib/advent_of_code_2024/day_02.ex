defmodule AdventOfCode2024.Day02 do
  defp safe?(levels) do
    diffs =
      levels
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    (Enum.all?(diffs, fn diff -> diff < 0 end) || Enum.all?(diffs, fn diff -> diff > 0 end)) &&
      Enum.all?(diffs, fn diff -> abs(diff) <= 3 end)
  end

  def part1(reports) do
    reports
    |> Enum.map(fn report ->
      report
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.filter(&safe?/1)
    |> Enum.count()
  end

  defp safe_with_dampener?(levels) do
    levels
    |> Enum.with_index()
    |> Enum.map(fn {_, index} -> List.delete_at(levels, index) end)
    |> Enum.any?(fn dampened -> safe?(dampened) end)
  end

  def part2(reports) do
    reports
    |> Enum.map(fn report ->
      report
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.filter(fn report ->
      safe?(report) or safe_with_dampener?(report)
    end)
    |> Enum.count()
  end
end
