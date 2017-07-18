defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  def first_hand do
    [
      {:spade, 5},
      {:club, 4},
      {:heart, 3},
      {:diamond, 6},
      {:diamond, 11}
    ]
  end

  def second_hand do
    [
      {:spade, 10},
      {:club, 2},
      {:heart, 3},
      {:diamond, 4},
      {:diamond, 5}
    ]
  end

  test "return list" do
    # assert Poker.compare([first_hand, second_hand]) == [first_hand, []]
    assert Poker.compare([first_hand, second_hand]) == first_hand
  end

  test "when empty hand" do
    assert Poker.compare([[], []]) == :no_winner
  end

  test "when only first_hand" do
    assert Poker.compare([first_hand, []]) == first_hand
  end

  test "when first hand is higher" do
    assert Poker.compare([first_hand, second_hand]) == first_hand
  end

  test "when higher cards are equal" do
    assert Poker.compare([[{:a, 10}, {:a, 9}], [{:a, 10}, {:a, 8}]]) == [{:a, 10}, {:a, 9}]
  end
end
