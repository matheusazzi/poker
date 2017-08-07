defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  test "#rank" do
    assert Rank.rank([{:a, 10}, {:a, 9}]) ==  "1009"
    assert Rank.rank([{:a, 10}, {:a, 9}, {:h, 12}]) == "121009"
    assert Rank.rank([{:a, 14}, {:a, 9}, {:h, 14}]) == "141409"
    assert Rank.rank([{:a, 2}, {:b, 2}, {:c, 3}, {:a, 3}, {:b, 3}]) == "730303030202"
    assert Rank.rank([{:a, 12}, {:b, 12}, {:c, 11}, {:a, 11}, {:b, 11}]) == "7111111111212"
  end
end
