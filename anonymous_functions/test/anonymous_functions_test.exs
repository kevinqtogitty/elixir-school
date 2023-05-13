defmodule AnonymousFunctionsTest do
  use ExUnit.Case
  doctest AnonymousFunctions

  test "Returns a list of atoms" do
    assert AnonymousFunctions.get_equipment_list() == [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  end

  test "Returns a list of numbers, the toatl weight of each equipment" do
    assert AnonymousFunctions.get_weight_lbs(AnonymousFunctions.get_equipment_list()) == [6.6000000000000005, 44.0, 1.1, 11.0, 2]
  end

  test "Returns the head of a list" do
    assert AnonymousFunctions.get_first_item(AnonymousFunctions.get_equipment_list()) == :space_helmet
  end

  test "Returns a converted list of all capital strings" do
    assert AnonymousFunctions.atom_to_string(AnonymousFunctions.get_equipment_list()) == ["SPACE HELMET", "SPACE SUIT", "SNACKS", "GRAPPLING HOOK", "PROBE"]
  end
end
