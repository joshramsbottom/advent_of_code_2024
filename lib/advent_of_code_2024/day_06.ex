defmodule AdventOfCode2024.Day06 do
  defp step({r, c}, :up, guard_path, matrix) do
    if r == 0 do
      MapSet.put(guard_path, {r, c})
    else
      case Enum.at(Enum.at(matrix, r - 1), c) do
        value when value in [".", "^"] ->
          step({r - 1, c}, :up, MapSet.put(guard_path, {r, c}), matrix)

        "#" ->
          step({r, c}, :right, guard_path, matrix)
      end
    end
  end

  defp step({r, c}, :right, guard_path, matrix) do
    if c == length(Enum.at(matrix, 0)) - 1 do
      MapSet.put(guard_path, {r, c})
    else
      case Enum.at(Enum.at(matrix, r), c + 1) do
        value when value in [".", "^"] ->
          step({r, c + 1}, :right, MapSet.put(guard_path, {r, c}), matrix)

        "#" ->
          step({r, c}, :down, guard_path, matrix)
      end
    end
  end

  defp step({r, c}, :down, guard_path, matrix) do
    if r == length(matrix) - 1 do
      MapSet.put(guard_path, {r, c})
    else
      case Enum.at(Enum.at(matrix, r + 1), c) do
        value when value in [".", "^"] ->
          step({r + 1, c}, :down, MapSet.put(guard_path, {r, c}), matrix)

        "#" ->
          step({r, c}, :left, guard_path, matrix)
      end
    end
  end

  defp step({r, c}, :left, guard_path, matrix) do
    if c == 0 do
      MapSet.put(guard_path, {r, c})
    else
      case Enum.at(Enum.at(matrix, r), c - 1) do
        value when value in [".", "^"] ->
          step({r, c - 1}, :left, MapSet.put(guard_path, {r, c}), matrix)

        "#" ->
          step({r, c}, :up, guard_path, matrix)
      end
    end
  end

  def part1(matrix) do
    guard_path = MapSet.new()

    # Find the guard
    [{r, c}] =
      for {row, r} <- Enum.with_index(matrix),
          {char, c} <- Enum.with_index(row),
          char == "^" do
        {r, c}
      end

    step({r, c}, :up, guard_path, matrix)
    |> Enum.count()
  end
end
