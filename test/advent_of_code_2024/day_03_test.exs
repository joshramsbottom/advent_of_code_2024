defmodule AdventOfCode2024.Day03Test do
  use ExUnit.Case

  import AdventOfCode2024.Day03

  defp input do
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  end

  test "part1" do
    result = part1(input())

    assert result == 161
  end

  test "part2" do
    result = part2("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")

    assert result == 48
  end
end
