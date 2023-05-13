defmodule AnonymousFunctions do
  @moduledoc """
  Documentation for `AnonymousFunctions`.
  """

  @doc """
  ## Purpose
    - Returns a list of atoms

  ## Parameters
    - none

  ## Examples
    -iex> AnonymousFunctions.get_equipment_list() => [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  """
  def get_equipment_list() do
    [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  end

  def item_details(:space_helmet) do
    {3, :kg, 1}
  end

  def item_details(:space_suit) do
    {20, :kg, 1}
  end

  def item_details(:snacks) do
    {0.5, :kg, 10}
  end

  def item_details(:grappling_hook) do
    {5, :kg, 1}
  end

  def item_details(:probe) do
    {2, :lbs, 1}
  end

  def item_details(_other) do
    raise "unknown item"
  end

  @doc """
  ## Purpose
    - Returns a list of numbers, the toatl weight of each equipment

  ## Parameters
    - list: a list of atoms

  ## Examples
    -iex> AnonymousFunctions.get_weight_lbs(get_equipment_list()) => [6.6000000000000005, 44.0, 1.1, 11.0, 2]
  """
  def get_weight_lbs(list) when not is_list(list), do: IO.puts("Must be a list")
  def get_weight_lbs(list) do
    get_lbs = fn item ->
      {weight, type, _quantity} = item_details(item)
      case type do
        :kg -> weight * 2.2
        _ -> weight
      end
    end

    Enum.map(list, get_lbs)
  end

  @doc """
  ## Purpose
    - Returns the head of a list

  ## Parameters
    - list: a list of atoms

  ## Examples
    -iex> AnonymousFunctions.get_first_item(get_equipment_list()) => :space_helmet
  """
  def get_first_item(list) when not is_list(list), do: IO.puts("Must be a list")
  def get_first_item(list) do
    first = fn [head | _tail] -> head end
    first.(list)
  end

  @doc """
  ## Purpose
    - Returns a converted list of all capital strings

  ## Parameters
    - list: a list of atoms

  ## Examples
    -iex> AnonymousFunctions.atom_to_string(get_equipment_list()) => ["SPACE HELMET", "SPACE SUIT", "SNACKS", "GRAPPLING HOOK", "PROBE"]
  """
  def atom_to_string(list) do
    convert = fn x ->
      to_string(x)
        |> String.upcase()
        |> String.replace("_", " ")
    end
    Enum.map(list, convert)
  end
end
