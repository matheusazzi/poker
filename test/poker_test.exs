defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "when first hand is higher" do
    assert Poker.winner([{:a, 10}, {:a, 9}], [{:a, 10}, {:a, 8}]) == [{:a, 10}, {:a , 9}]
  end

  test "when second hand is higher" do
    assert Poker.winner([{:a, 10}, {:a, 9}, {:h, 12}], [{:a, 10}, {:a, 8}, {:h, 13}]) == [{:a, 10}, {:a , 8}, {:h, 13}]
  end

  test "when higher cards are equal" do
    assert Poker.winner([{:a, 1}, {:a, 2}, {:h, 12}], [{:a, 1}, {:a, 2}, {:h, 12}]) == :draw
  end
end
