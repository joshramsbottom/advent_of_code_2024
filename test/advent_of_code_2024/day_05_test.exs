defmodule AdventOfCode2024.Day05Test do
  use ExUnit.Case

  import AdventOfCode2024.Day05

  defp rules() do
    [
      "47|53",
      "97|13",
      "97|61",
      "97|47",
      "75|29",
      "61|13",
      "75|53",
      "29|13",
      "97|29",
      "53|29",
      "61|53",
      "97|53",
      "61|29",
      "47|13",
      "75|47",
      "97|75",
      "47|61",
      "75|61",
      "47|29",
      "75|13",
      "53|13"
    ]
  end

  defp updates() do
    [
      "75,47,61,53,29",
      "97,61,53,29,13",
      "75,29,13",
      "75,97,47,61,53",
      "61,13,29",
      "97,13,75,29,47"
    ]
  end

  test "part1" do
    result = part1(rules(), updates())
    assert result == 143
  end

  test "part2" do
    result = part2(rules(), updates())
    assert result == 123
  end
end
