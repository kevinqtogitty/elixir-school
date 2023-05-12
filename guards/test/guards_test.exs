defmodule GuardsTest do
  use ExUnit.Case
  doctest Guards

  test "Returns :integer when given an integer" do
    assert Guards.type(1) == :integer
  end

  test "Returns :float when given an float" do
    assert Guards.type(10.3) == :float
  end

  test "Returns :not_number when given anything but a number" do
    assert Guards.type("Yo") == :not_number
  end

  test "Returns the atom :true if the given arg is a single digit int" do
    assert Guards.is_single_digit(9) == :true
  end

  test "Returns the atom :false if the given arg is a double digit int" do
    assert Guards.is_single_digit(11) == :false
  end

  test "Returns the atom :false if the given arg is an is an atom" do
    assert Guards.is_single_digit(:number?) == :false
  end

  test "Returns the atom :not_even if no argument is given" do
    assert Guards.return_even_numbers() == :not_even
  end

  test "Returns the arg if the given arg is an even number" do
    assert Guards.return_even_numbers(66) == 66
  end

  test "Returns the atom :not_even if the given arg is an odd number" do
    assert Guards.return_even_numbers(99) == :not_even
  end

  test "Returns the atom :not_even if the given arg is a string" do
    assert Guards.return_even_numbers("Hello") == :not_even
  end

  test "Returns the atom :not_even if the given arg is a boolean" do
    assert Guards.return_even_numbers(false) == :not_even
  end
end
