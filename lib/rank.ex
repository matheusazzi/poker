defmodule Rank do
  def rank(hand) do
    cond do
      Hand.is_flush(hand) -> high_card_rank(hand)
      Hand.is_pair(hand)  -> "#{Hand.is_pair(hand)}#{high_card_rank(hand)}"
      Hand.is_high_card(hand) -> high_card_rank(hand)
    end
  end

  defp high_card_rank(hand) do
    Enum.map(hand, fn(card) -> elem(card, 1) end)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(&insert_zero_pad_left/1)
    |> Enum.sort(fn(face1, face2) -> face1 > face2 end)
    |> Enum.join
  end

  defp insert_zero_pad_left(value) do
    cond  do
      String.to_integer(value) < 10 -> String.pad_leading(value, 2, "0")
      true -> value
    end
  end
end
