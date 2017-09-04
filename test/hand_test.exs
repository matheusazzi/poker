defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  test "#is_high_card" do
    assert Hand.is_high_card([{:spade, 5}, {:club, 4}, {:heart, 3}, {:diamond, 6}, {:diamond, 11}])
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

  test "#is_flush" do
    assert Hand.is_flush([{:a, 1}, {:a, 3}, {:a, 5}, {:a, 7}, {:a, 9}, {:a, 10}]) == true
    assert Hand.is_flush([{:b, 4},{ :b, 2}, {:b, 5}, {:b, 7}, {:b, 9}, {:b, 10}]) == true
  end
  
  test "!not !#is_flush" do    
    assert Hand.is_flush([{:a, 1},{ :c, 3}, {:a, 5}, {:a, 7}, {:a, 9}, {:b, 10}]) == false
  end

end
