defmodule Strings do
  @moduledoc """
  Documentation for `Strings`.
  """

  @doc """
  ## Purpose
    - Trims whitespace from a given string.

  ## Parameters
    - value: a string containing whitespace.

  ## Examples
    -iex> Strings.trim_string("  Hello World  ") => "Hello World"
  """

  def trim_string(value) do
    String.trim(value)
  end

  @doc """
  ## Purpose
    - Trims whitespace from a given string, and returns the first char of that trimmed string.

  ## Parameters
    - value: a string containing whitespace.

  ## Examples
    -iex> Strings.trim_string_get_first("  hello world  ") => "h"
  """

  def trim_string_get_first(value) do
    String.trim(value)
    |> String.first()
  end

  @doc """
   ## Purpose
    - Trims whitespace from a given string,
      and returns the first char of that trimmed string but
      CAPITALIZED with a period after followed by a whitespace.

  ## Parameters
    - value: a string/name containing whitespace.

  ## Examples
    -iex> Strings.capitlize_initial("  kevin ") => "K. "
  """

  def capitalize_initial(value) do
   "#{trim_string_get_first(value) |> String.capitalize()}. "
  end

  @doc """
   ## Purpose
    - Takes in a name and returns the properly formatted initials

  ## Parameters
    - value: a string/name containing whitespace.

  ## Examples
    -iex> Strings.capitlize_initial("  kevin To  ") => "K. T."
  """

  def capitalize_initials(value) do
    String.split(value)
    |> Enum.map(fn name ->
      capitalize_initial(name)
    end)
    |> List.to_string()
    |> String.trim()
  end

  def display_saucer(saucer), do: IO.puts(saucer)

  def build_saucer() do
    """

                        %%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ************************************************************
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
           ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """
  end

  def customize_saucer(name) do
    custom_line = "******************* #{capitalize_initials(name)}' s SPACECRAFT *******************"
    build_saucer()
    |> String.replace("************************************************************", custom_line)
    |> display_saucer()
  end

end
