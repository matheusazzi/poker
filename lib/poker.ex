defmodule Poker do
  def winner(hand1, hand2) do
    first_hand_rank = String.to_integer Rank.rank(hand1)
    second_hand_rank = String.to_integer Rank.rank(hand2)

    cond do
      first_hand_rank > second_hand_rank -> hand1
      first_hand_rank < second_hand_rank -> hand2
      true -> :draw
    end
  end
end
