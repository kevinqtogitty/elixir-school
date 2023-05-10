defmodule ListsTest do
  use ExUnit.Case
  doctest Lists

  test "Returns an equipment list" do
    assert Lists.get_equipment_list() == ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  end

  test "Returns the first item in a list" do
    assert Lists.get_first_item(Lists.get_equipment_list()) == "Space Helmet"
  end

  test "Returns the tail of a list" do
    assert Lists.get_tail(Lists.get_equipment_list()) == ["Space Suit", "Snacks", "Grapling hook", "probe"]
  end

  test "Appends an item to a list, slow method" do
    assert Lists.add_to_list_slow(Lists.get_equipment_list(), "Boots") == ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe", "Boots"]
  end

  test "Prepends and item to a list" do
    assert Lists.prepend_list(Lists.get_equipment_list(), "Boots") == ["Boots", "Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  end

  test "Appends an item to a list, fast method with list reversal" do
    assert Lists.add_to_list_fast(Lists.get_equipment_list(), "Boots") == ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe", "Boots"]
  end

  test "Removes and item at the given index" do
    assert Lists.remove_item(Lists.get_equipment_list(), 4) == ["Space Helmet", "Space Suit", "Snacks", "Grapling hook"]
  end

  test "Returns the length of the given list" do
    assert Lists.equipment_count(Lists.get_equipment_list()) == 5
  end

  test "Returns false if item does not exist in list" do
    assert Lists.equipment_exists(Lists.get_equipment_list(), "Flame Thrower") == false
  end
  test "Returns true if item does exists in list" do
    assert Lists.equipment_exists(Lists.get_equipment_list(), "Space Helmet") == true
  end
end
