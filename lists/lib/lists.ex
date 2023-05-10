defmodule Lists do
  @moduledoc """
  Documentation for `Lists`.
  """


  @doc """
  ## Purpose
    - Returns the equipment list.

  ## Parameters
    - none

  ## Examples
    -iex> Lists.get_equipment_list() => ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  """

  def get_equipment_list() do
    ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  end

  @doc """
  ## Purpose
    - Returns the head of a list.

  ## Parameters
    - list: a list of items

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.get_first_item(list) => "Space Helmet"
  """

  def get_first_item(list) do
    hd(list)
  end

  @doc """
  ## Purpose
    - Returns the tail of a list.

  ## Parameters
    - list: a list of items

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.get_tail(list) => ["Space Suit", "Snacks", "Grapling hook", "probe"]
  """

  def get_tail(list) do
    tl(list)
  end

  @doc """
  ## Purpose
    - adds item to the end of the linked list, this is the slow method

  ## Parameters
    - list: a list of items
    - value: a string literal eg "Boots"

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.add_to_list_slow(list, "Boots") => ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe", "Boots"]
  """

  def add_to_list_slow(list, value) do
    list ++ [value]
  end

  @doc """
  ## Purpose
    - adds item to the beginning of the linked list

  ## Parameters
    - list: a list of items
    - value: a string literal eg "Boots"

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.prepend_list(list, "Boots") => ["Boots", "Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]
  """

  def prepend_list(list, value), do: [value | list]

  @doc """
  ## Purpose
    - adds item to the end of the linked list, this is the fast method wich employs linked list reversal

  ## Parameters
    - list: a list of items
    - value: a string literal eg "Boots"

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.add_to_list_fast(list, "Boots") => ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe", "Boots"]
  """

  def add_to_list_fast(list, value) do
    Enum.reverse(list)
    |> prepend_list(value)
    |> Enum.reverse()
  end

  @doc """
  ## Purpose
    - removes an item from the list at the given index

  ## Parameters
    - list: a list of items
    - index: an integer

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> ["Space Helmet", "Space Suit", "Snacks", "Grapling hook", "probe"]

  -iex> Lists.remove_item(list, 3) => ["Space Helmet", "Space Suit", "Snacks", "Grapling hook"]
  """

  def remove_item(list, index) do
    List.delete_at(list, index)
  end

  @doc """
  ## Purpose
    - adds item to the end of the linked list, this is the fast method wich employs linked list reversal

  ## Parameters
    - list: a list of items
    - value: a string literal eg "Boots"

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.equipment_count(list) => 4\
  """

  def equipment_count(list) do
    length(list )
  end

  @doc """
  ## Purpose
    - adds item to the end of the linked list, this is the fast method wich employs linked list reversal

  ## Parameters
    - list: a list of items
    - value: a string literal eg "Boots"

  ## Examples
  -iex> list = Lists.get_equipment_list()

  -iex> Lists.add_to_list_fast(list, "Boots") => false
  """

  def equipment_exists(list, item) do
    item in list
  end
end
