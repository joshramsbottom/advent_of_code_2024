defmodule AdventOfCode2024.Day05 do
  defp get_before_page_rules(ruleMap, page) do
    ruleMap
    |> Enum.filter(fn {_, r} -> r == page end)
    |> Enum.map(fn {l, _} -> l end)
  end

  defp get_after_page_rules(ruleMap, page) do
    ruleMap
    |> Enum.filter(fn {l, _} -> l == page end)
    |> Enum.map(fn {_, r} -> r end)
  end

  defp update_in_right_order?(update, ruleMap) do
    update
    |> Enum.with_index()
    |> Enum.reduce(true, fn {page, index}, acc ->
      {before_pages, [_ | after_pages]} = Enum.split(update, index)
      before_rules = get_before_page_rules(ruleMap, page)
      after_rules = get_after_page_rules(ruleMap, page)

      acc and
        Enum.all?(before_pages, &(&1 in before_rules)) and
        Enum.all?(after_pages, &(&1 in after_rules))
    end)
  end

  defp correct_update_order(update, ruleMap) do
    update
    |> Enum.sort(
      &(length(get_before_page_rules(ruleMap, &1)) - length(get_after_page_rules(ruleMap, &1)) <
          length(get_before_page_rules(ruleMap, &2)) - length(get_after_page_rules(ruleMap, &2)))
    )
  end

  def part1(rules, updates) do
    ruleMap =
      rules
      |> Enum.map(fn r ->
        String.split(r, "|") |> Enum.map(&String.to_integer/1) |> List.to_tuple()
      end)

    updates
    |> Enum.map(fn u -> String.split(u, ",") |> Enum.map(&String.to_integer/1) end)
    |> Enum.filter(fn u -> update_in_right_order?(u, ruleMap) end)
    |> Enum.reduce(0, fn u, acc -> acc + Enum.at(u, div(length(u), 2)) end)
  end

  def part2(rules, updates) do
    ruleMap =
      rules
      |> Enum.map(fn r ->
        String.split(r, "|") |> Enum.map(&String.to_integer/1) |> List.to_tuple()
      end)

    updates
    |> Enum.map(fn u -> String.split(u, ",") |> Enum.map(&String.to_integer/1) end)
    |> Enum.filter(fn u -> !update_in_right_order?(u, ruleMap) end)
    |> Enum.map(fn u -> correct_update_order(u, ruleMap) end)
    |> IO.inspect()
    |> Enum.reduce(0, fn u, acc -> acc + Enum.at(u, div(length(u), 2)) end)
  end
end
