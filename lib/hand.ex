defmodule Hand do

  def values do
    %{
      :straight_flush => 9,
      :four_of_a_kind => 8,
      :full_house => 7,
      :flush => 6,
      :straight => 5,
      :three_of_a_kind => 4,
      :two_pair => 3,
      :one_pair => 2,
      :high_card => 1,
    }
  end

  def is_high_card(_) do
    true
  end

  def is_pair(hand) do
    hand
    |> sort_hand
    |> pair
  end

  def is_full_house(hand) do
    hand
    |> sort_hand
    |> full_house
  end

  def pair([{_, val}, {_, val}, {_, _}, {_, _}, {_, _}]) do
    val
  end

  def pair([{_, _}, {_, val}, {_, val}, {_, _}, {_, _}]) do
    val
  end

  def pair([{_, _}, {_, _}, {_, val}, {_, val}, {_, _}]) do
    val
  end

  def pair([{_, _}, {_, _}, {_, _}, {_, val}, {_, val}]) do
    val
  end

  def pair(_) do
    false
  end

  def full_house([{_, one_pair}, {_, one_pair}, {_, three_of_kind}, {_, three_of_kind}, {_, three_of_kind}]) do
    three_of_kind
  end

  def full_house([{_, three_of_kind}, {_, three_of_kind}, {_, three_of_kind}, {_, one_pair}, {_, one_pair}]) do
    three_of_kind
  end

  def full_house(_) do
    false
  end

  defp sort_hand(hand) do
    hand
    |> Enum.sort fn(card1, card2) -> elem(card1, 1) > elem(card2, 1) end
  end
end
