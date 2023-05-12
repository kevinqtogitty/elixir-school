defmodule RecursionTest do
  use ExUnit.Case
  doctest Recursion

  test "Returns equipment list" do
    assert Recursion.get_equipment_list() == ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  end

  test "Prints the head of the list" do
    assert Recursion.loop(["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]) = "Space Helmet\n Space Suit\n Snacks\n Grapling hook\n probe\n nil"
  end
end
