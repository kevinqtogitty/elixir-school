defmodule Equipment do
  def get_equipment_list() do
    [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  end

  def item_details(:space_helmet) do
    {3, :kg, 1}
  end

  def item_details(:space_suit) do
    {0, :kg, 1}
  end

  def item_details(:snacks) do
    {0.5, :kg, 10}
  end

  def item_details(:grappling_hook) do
    {5, :kg, 1}
  end

  def item_details(:probe) do
    {2, :kg, 1}
  end

  def item_details(_other) do
    raise "unknown item"
  end
end
