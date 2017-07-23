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

  test "#is_high_card" do
    assert Hand.is_high_card(first_hand)
  end
end
