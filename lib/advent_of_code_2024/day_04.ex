defmodule AdventOfCode2024.Day04 do
  defp get_chars({from_x, from_y}, {to_x, to_y}, size, matrix) do
    cond do
      to_x < 0 || to_y < 0 ->
        []

      to_x >= length(matrix) || to_y >= length(Enum.at(matrix, 0)) ->
        []

      from_x == to_x && to_y < from_y ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x), from_y - offset)
        end

      from_x == to_x && to_y > from_y ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x), from_y + offset)
        end

      from_y == to_y && to_x > from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x + offset), from_y)
        end

      from_y == to_y && to_x < from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x - offset), from_y)
        end

      to_y > from_y && to_x > from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x + offset), from_y + offset)
        end

      to_y < from_y && to_x > from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x + offset), from_y - offset)
        end

      to_y > from_y && to_x < from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x - offset), from_y + offset)
        end

      to_y < from_y && to_x < from_x ->
        for offset <- 0..size do
          Enum.at(Enum.at(matrix, from_x - offset), from_y - offset)
        end
    end
  end

  def part1(matrix) do
    for {row, r} <- Enum.with_index(matrix),
        {char, c} <- Enum.with_index(row),
        char == "X" do
      {r, c}
    end
    |> Enum.reduce(0, fn {r, c}, acc ->
      # Get chars in all directions
      acc +
        ([
           get_chars({r, c}, {r, c + 3}, 3, matrix),
           get_chars({r, c}, {r, c - 3}, 3, matrix),
           get_chars({r, c}, {r + 3, c}, 3, matrix),
           get_chars({r, c}, {r - 3, c}, 3, matrix),
           get_chars({r, c}, {r + 3, c + 3}, 3, matrix),
           get_chars({r, c}, {r + 3, c - 3}, 3, matrix),
           get_chars({r, c}, {r - 3, c + 3}, 3, matrix),
           get_chars({r, c}, {r - 3, c - 3}, 3, matrix)
         ]
         |> Enum.filter(fn chars -> Enum.join(chars) == "XMAS" end)
         |> Enum.count())
    end)
  end

  def part2(matrix) do
    a_coords =
      for {row, r} <- Enum.with_index(matrix),
          {char, c} <- Enum.with_index(row),
          char == "M" do
        {r, c}
      end
      |> Enum.map(fn {r, c} ->
        # Get chars in diagonal directions with coord of "A"
        [
          {get_chars({r, c}, {r + 2, c + 2}, 2, matrix), {r + 1, c + 1}},
          {get_chars({r, c}, {r + 2, c - 2}, 2, matrix), {r + 1, c - 1}},
          {get_chars({r, c}, {r - 2, c + 2}, 2, matrix), {r - 1, c + 1}},
          {get_chars({r, c}, {r - 2, c - 2}, 2, matrix), {r - 1, c - 1}}
        ]
        |> Enum.filter(fn {chars, _} -> Enum.join(chars) == "MAS" end)
        |> Enum.map(fn {_, coords} -> coords end)
      end)
      |> List.flatten()

    a_coords
    |> MapSet.new()
    |> MapSet.filter(fn coord ->
      Enum.count(a_coords, &(&1 == coord)) == 2
    end)
    |> Enum.count()
  end
end
