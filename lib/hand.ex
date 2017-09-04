defmodule Hand do

  def is_high_card(_) do
    true
  end

  def is_pair(hand) do
    hand
    |> sort_hand
    |> pair
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

  def is_flush(hand) do
    1 === Enum.group_by(hand, fn {suite, _} -> suite end) |> Map.size
  end

  defp sort_hand(hand) do
    hand
    |> Enum.sort fn(card1, card2) -> elem(card1, 1) > elem(card2, 1) end
  end
end
