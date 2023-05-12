defmodule PrefFlightCheck do
  defp convert_kg_to_lb(kg), do: 2.2 * kg

  def get_load([]), do: 0
  def get_load([head | tail]) do
    (head
      |> Equipment.item_details()
      |> elem(0)
      |> convert_kg_to_lb()
    ) + get_load(tail)
  end

  def check_load(list) do
    is_overloaded?(get_load(list))
  end

  def is_overloaded?(load, max \\ 55)
  def is_overloaded?(load, max) when max > load, do: {:overloaded?, false, load}
  def is_overloaded?(load, max) when load >= max, do: {:overloaded?, true, load}

end
