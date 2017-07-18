defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  def first_hand do
    [
      {:spade, 5},
      {:club, 4},
      {:heart, 3},
      {:diamond, 6},
      {:diamond, 11}
    ]
  end

  test "hand is high_card" do
    assert Hand.which_hand(first_hand) == {:high_card, first_hand}
  end

  test "high_card returns the high card" do
    assert Hand.high_card(first_hand) == {:diamond, 11}
    assert Hand.high_card([{:diamond, 2}, {:heart, 3}]) == {:heart, 3}
    assert Hand.high_card([{:diamond, 2}, {:heart, 1}]) == {:heart, 1}
    assert Hand.high_card([{:diamond, 1}, {:heart, 12}]) == {:diamond, 1}
  end
end
