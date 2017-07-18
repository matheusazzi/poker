defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  test "#rank" do
    assert Rank.rank([{:a, 10}, {:a, 9}]) ==  "1009"
    assert Rank.rank([{:a, 10}, {:a, 9}, {:h, 12}]) == "121009"
    assert Rank.rank([{:a, 1}, {:a, 9}, {:h, 1}]) == "090101"
  end
end
