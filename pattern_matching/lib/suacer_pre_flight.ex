defmodule SuacerPreFlight do
  defp max_flying_load_lbs(), do: 55

  defp convert_kg_to_lb(kg), do: 2.2 * kg

  def calculate_equipment_weight([]), do: 0
  def calculate_equipment_weight([head | tail]) do
    (head
      |> EquipmentDetail.item_details()
      |> elem(0)
      |> convert_kg_to_lb()
    ) + calculate_equipment_weight(tail)
  end

  def is_overloaded?(list) do
    final_load = calculate_equipment_weight(list)
    if max_flying_load_lbs() >  final_load do
      {false, final_load}
    else
      {true, final_load}
    end
  end
end
