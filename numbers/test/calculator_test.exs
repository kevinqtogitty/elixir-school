defmodule CalculatorTest do
  use ExUnit.Case
    doctest Calculator

    test "Returns 25.0 given (25, 100)" do
      assert Calculator.find_percentage_of_value(25, 100) == 25.0
    end

    test "Returns 25.0 given (25, 100)" do
      assert Calculator.find_percentage_of_value(25, 100) == 25.0
    end

end
