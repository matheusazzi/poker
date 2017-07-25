defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  test "#rank" do
    assert Rank.rank([{:a, 10}, {:a, 9}]) ==  "1009"
    assert Rank.rank([{:a, 10}, {:a, 9}, {:h, 12}]) == "121009"
    assert Rank.rank([{:a, 14}, {:a, 9}, {:h, 14}]) == "141409"
  end
end
