defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "when first hand is higher" do
    assert Poker.winner([{:a, 10}, {:a, 9}], [{:a, 10}, {:a, 8}]) == [{:a, 10}, {:a , 9}]
    assert Poker.winner([{:a, 14}, {:a, 9}], [{:a, 13}, {:a, 10}]) == [{:a, 14}, {:a, 9}]
  end

  test "when second hand is higher" do
    assert Poker.winner([{:a, 10}, {:a, 9}, {:h, 12}], [{:a, 10}, {:a, 8}, {:h, 13}]) == [{:a, 10}, {:a , 8}, {:h, 13}]
  end

  test "when higher cards are equal" do
    assert Poker.winner([{:a, 14}, {:a, 2}, {:h, 12}], [{:a, 14}, {:a, 2}, {:h, 12}]) == :draw
  end

  test "pair wins against high_card" do
    pair = [{:a, 2}, {:a, 2}, {:h, 12}, {:h, 10}, {:h, 9}]
    high_card =  [{:a, 14}, {:a, 2}, {:h, 12}, {:h, 11}, {:h, 10}]
    assert Poker.winner(pair, high_card) == pair
  end

  test "greater pair wins" do
    hand_one = [{:a, 2}, {:a, 2}, {:h, 12}, {:h, 10}, {:h, 9}]
    hand_two = [{:a, 3}, {:a, 3}, {:h, 7}, {:h, 10}, {:h, 9}]
    assert Poker.winner(hand_two, hand_one) == hand_two
  end

  test "full house wins against pair" do
    pair = [{:a, 5}, {:a, 5}, {:h, 12}, {:h, 10}, {:h, 9}]
    full_house = [{:c, 3}, {:a, 3}, {:b, 3}, {:a, 2}, {:b, 2}]
    assert Poker.winner(full_house, pair) == full_house
  end

  test "greater full house wins" do
    hand_one = [{:c, 4}, {:a, 4}, {:b, 4}, {:a, 2}, {:b, 2}]
    hand_two = [{:d, 3}, {:d, 3}, {:d, 3}, {:e, 10}, {:e, 10}]
    assert Poker.winner(hand_one, hand_two) == hand_one
  end

end
