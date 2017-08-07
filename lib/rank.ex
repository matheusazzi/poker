defmodule Rank do
  def rank(hand) do
    cond do
      Hand.is_full_house(hand) -> "#{Hand.values()[:full_house]}#{Hand.is_full_house(hand)}#{full_house_rank(hand)}"
      Hand.is_pair(hand) -> "#{Hand.is_pair(hand)}#{high_card_rank(hand)}"
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

  defp high_card_rank_without_sort(hand) do
    Enum.map(hand, fn(card) -> elem(card, 1) end)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(&insert_zero_pad_left/1)
    |> Enum.join
  end

  defp full_house_rank([{_, one_pair}, {_, one_pair}, {_, three_of_kind}, {_, three_of_kind}, {_, three_of_kind}]) do
    hand = [{:a, three_of_kind}, {:a, three_of_kind}, {:a, three_of_kind}, {:a, one_pair}, {:a, one_pair}]
    high_card_rank_without_sort(hand)
  end

  defp full_house_rank([{_, three_of_kind}, {_, three_of_kind}, {_, three_of_kind}, {_, one_pair}, {_, one_pair}]) do
    hand = [{:a, three_of_kind}, {:a, three_of_kind}, {:a, three_of_kind}, {:a, one_pair}, {:a, one_pair}]
    high_card_rank_without_sort(hand)
  end

  defp insert_zero_pad_left(value) do
    String.pad_leading(value, 2, "0")
  end
end
