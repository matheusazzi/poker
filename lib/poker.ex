defmodule Poker do

  def compare([[], []]) do
    :no_winner
  end

  def compare([first_hand, []]) do
    first_hand
  end

  def compare([first_hand, second_hand]) do
    { _, first_max } = Hand.high_card(first_hand)
    { _, second_max } = Hand.high_card(second_hand)

    cond do
      first_max == second_max ->
        { _, first_max } = Hand.high_card(first_hand)
        { _, second_max } = Hand.high_card(second_hand)

      first_max > second_max -> first_hand
      true -> second_hand
    end
  end
end
