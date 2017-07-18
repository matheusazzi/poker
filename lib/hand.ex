defmodule Hand do
  def which_hand(hand) do
    {:high_card, hand}
  end

  def high_card([head | tail]) do
    compare_card(head, tail)
  end

  defp compare_card(first, [second | tail]) do
    cond do
      elem(first, 1) == 1 -> first
      elem(second, 1) == 1 -> second
      elem(first, 1) > elem(second, 1) -> compare_card(first, tail)
      true -> compare_card(second, tail)
    end
  end

  defp compare_card(first, []) do
    first
  end
end
