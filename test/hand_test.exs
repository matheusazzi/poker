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

  test "#is_pair" do
    assert Hand.is_pair([{:a, 2}, {:b, 2}, {:c, 3}, {:c, 4}, {:c, 5}]) == 2
    assert Hand.is_pair([{:a, 14}, {:b, 2}, {:c, 2}, {:c, 4}, {:c, 5}]) == 2
    assert Hand.is_pair([{:a, 14}, {:b, 3}, {:c, 2}, {:c, 2}, {:c, 5}]) == 2
    assert Hand.is_pair([{:a, 14}, {:b, 3}, {:c, 5}, {:c, 2}, {:c, 2}]) == 2
    assert Hand.is_pair([{:a, 14}, {:b, 3}, {:c, 5}, {:c, 2}, {:c, 14}]) == 14
    assert Hand.is_pair([{:a, 14}, {:b, 3}, {:c, 5}, {:c, 2}, {:c, 5}]) == 5
    assert Hand.is_pair([{:a, 14}, {:b, 3}, {:c, 5}, {:c, 3}, {:c, 12}]) == 3
  end

  test "!not !#is_pair" do
    assert Hand.is_pair([{:a, 2}, {:b, 9}, {:c, 3}, {:c, 4}, {:c, 5}]) == false
  end

  test "#is_full_house" do
    assert Hand.is_full_house([{:a, 2}, {:c, 3}, {:a, 3}, {:b, 3}, {:b, 2}]) == 3
    assert Hand.is_full_house([{:c, 3}, {:a, 3}, {:b, 3}, {:a, 2}, {:b, 2}]) == 3
    assert Hand.is_full_house([{:c, 3}, {:a, 3}, {:a, 2}, {:b, 3}, {:b, 2}]) == 3
    assert Hand.is_full_house([{:c, 3}, {:b, 3}, {:a, 2}, {:b, 2}, {:a, 3}]) == 3
    assert Hand.is_full_house([{:b, 3}, {:a, 2}, {:c, 3}, {:b, 2}, {:a, 3}]) == 3
    assert Hand.is_full_house([{:b, 3}, {:a, 2}, {:b, 2}, {:c, 3}, {:a, 3}]) == 3
    assert Hand.is_full_house([{:a, 2}, {:b, 3}, {:b, 2}, {:c, 3}, {:a, 3}]) == 3
    assert Hand.is_full_house([{:a, 2}, {:b, 2}, {:b, 3}, {:c, 3}, {:a, 3}]) == 3
  end

  test "!not !#is_full_house" do
    assert Hand.is_full_house([{:a, 2}, {:b, 2}, {:c, 3}, {:c, 4}, {:c, 5}]) == false
    assert Hand.is_full_house([{:a, 2}, {:b, 9}, {:c, 3}, {:c, 4}, {:c, 5}]) == false
  end
end
