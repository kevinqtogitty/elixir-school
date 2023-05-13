defmodule ControlFlow do
  @moduledoc """
  Documentation for `ControlFlow`.
  """

  @doc """
  ## Purpose
    - Checks if equipment is too heavy

  ## Parameters
    - load: int

  ## Examples
    -iex> ControlFlow.check_max_load(1) => "Safe to fly!"

    -iex> ControlFlow.check_max_load(100) => "Too heavy to fly!"

    -iex> ControlFlow.check_max_load(:100) => "Load arg must be type INT"
  """
  def check_max_load(load) when not is_integer(load), do: "Load arg must be type INT"
  def check_max_load(load) do
    if load < 55, do: "Safe to fly!", else: "Too heavy to fly!"
    # unless load < 55, do: "Too heavy to fly!" , else: "Safe to fly!"
  end

  @doc """
  ## Purpose
    - Checks fuel levels

  ## Parameters
    - percentage: number

  ## Examples
    -iex> ControlFlow.check_fuel_levels(100) => "Full tank"

    -iex> ControlFlow.check_fuel_levels(:100) => "Percentage must be a number!"

    -iex> ControlFlow.check_fuel_levels(0) => "empty tank"
  """

  def check_fuel_levels(percentage) when not is_number(percentage), do: "Percentage must be a number"
  def check_fuel_levels(percentage) do
    cond do
      percentage == 100 -> "Full tank"
      percentage > 75 -> "Three quarters of a tank"
      percentage > 49 -> "Half tank"
      percentage > 24 -> "Quarter tank"
      true -> "empty tank"
    end
  end

  @doc """
  ## Purpose
    - Checks fuel levels

  ## Parameters
    - percentage: number

  ## Examples
    -iex> ControlFlow.error_code_check(200) => :ok

    -iex> ControlFlow.error_code_check(404) => :error

    -iex> ControlFlow.error_code_check(204) => :no_content

    -iex> ControlFlow.error_code_check("500") => :no_content
  """
  def error_code_check(code) do
    case code do
      200 -> :ok
      201 -> :created
      204 -> :no_content
      n when is_integer(n) and n > 299 -> :error
      _ -> :unknown
    end
  end

  defp convert_kg_to_lbs(kg), do: kg * 2.2

  @doc """
  ## Purpose
    - Checks if certain equipment can be cleared to be added to our saucer

  ## Parameters
    - equipment_tuple: tuple
    eg. {2, :kg, 3}

  ## Examples
    -iex> ControlFlow.equipment_check({2, :kg, 3}) => :equipment_cleared

    -iex> ControlFlow.equipment_check({2, :lbs, 3}) => :equipment_cleared

    -iex> ControlFlow.equipment_check({50, :kg, 3}) => :failed

    -iex> ControlFlow.equipment_check({2, "kg", 3}) => "Unit type must be either :lbs or :kg"

    -iex> ControlFlow.equipment_check({"2", :kg, 3}) => "Weight must be an integer"

    -iex> ControlFlow.equipment_check({2, :kg}) => "Tuple must contain 3 arguments"
  """
  def equipment_check(equipment_tuple) when tuple_size(equipment_tuple) != 3, do: "Tuple must contain 3 arguments"
  def equipment_check(equipment_tuple) do
    case equipment_tuple do
      {weight, _unit_type, _quantity} when not is_integer(weight)
        -> "Weight must be an integer"
      {_weight, unit_type, _quantity} when not is_atom(unit_type)
        -> "Unit type must be an atom"
      {_weight, unit_type, _quantity} when not unit_type == :lbs or :kg
        -> "Unit type must be either :lbs or :kg"
      {weight, unit_type, quantity} when unit_type == :kg
        -> if weight / quantity < 16, do: :equipment_cleared, else: :failed
      {weight, unit_type, quantity} when unit_type == :lbs
        -> if convert_kg_to_lbs(weight) / quantity < 16, do: :equipment_cleared, else: :failed
      _ -> :unknown
    end
  end
end
