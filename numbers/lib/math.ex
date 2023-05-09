defmodule BasicMath do
  def add(val1, val2), do: val1 + val2

  def subtract(val1, val2), do: val1 - val2

  def divide(val1, val2), do: round_up(val1 / val2)

  def multiply(val1, val2), do: val1 * val2

  def round_up(val) do
    if is_integer(val) == true do
      round(val)
    else
      Float.ceil(val, 2)
    end
  end

end
