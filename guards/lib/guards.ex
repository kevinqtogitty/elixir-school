defmodule Guards do
  @moduledoc """
  Documentation for `Guards`.
  """

  @doc """
  ## Purpose
    - Returns the atom :integer if the given arg is an integer
    - Returns the atom :float if the given arg is an float
    - Returns the atom :not_number if the given arg is not a number

  ## Parameters
    - value: integer

  ## Examples
    -iex> Guards.type(1) => :integer
    -iex> Guards.type(10.3) => :float
    -iex> Guards.type("yo") => :not_number

  """
  def type(value) when is_integer(value), do: :integer
  def type(value) when is_float(value), do: :float
  def type(value) when not is_number(value), do: :not_number

  @doc """
  ## Purpose
    - Returns the atom :true if the given arg is an integer and is less than 10
    - Returns the atom :false if the given arg is an is not a number OR is greater than 9

  ## Parameters
    - value: int

  ## Examples
    -iex> Guards.is_single_digit(9) => :true
    -iex> Guards.is_single_digit(11) => :false
    -iex> Guards.is_single_digit(:number?) => :false
  """
  def is_single_digit(value) when is_integer(value) and value < 10, do: :true
  def is_single_digit(value) when not is_integer(value) or value > 9, do: :false

  defguardp is_even(value) when is_integer(value) and rem(value, 2) == 0

  @doc """
  ## Purpose
    - default value is an atom
    - Returns the value if it is even
    - Returns the :not_even if it is odd

  ## Parameters
    - value: any

  ## Examples
    -iex> Guards.return_even_numbers() => :not_even
    -iex> Guards.return_even_numbers(66) => 66
    -iex> Guards.return_even_numbers(99) => :not_even
    -iex> Guards.return_even_numbers("Hello") => :not_even
  """
  def return_even_numbers(value \\ :no_arg_provided)
  def return_even_numbers(value) when is_even(value), do: value
  def return_even_numbers(value) when not is_even(value), do: :not_even
end
