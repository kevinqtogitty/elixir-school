defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test "Returns 'Safe to fly' given 1 as argument" do
    assert ControlFlow.check_max_load(1) == "Safe to fly!"
  end

  test "Returns 'Too heavy to fly!' given 100 as argument" do
    assert ControlFlow.check_max_load(100) == "Too heavy to fly!"
  end

  test "Returns 'Load arg must be type INT' given a non integer arg" do
    assert ControlFlow.check_max_load("100") == "Load arg must be type INT"
  end

  test "Returns 'Full tank' when given 100 as the argument" do
    assert ControlFlow.check_fuel_levels(100) == "Full tank"
  end

  test "Returns 'Percentage must be a number!' when given '100' as the argument" do
    assert ControlFlow.check_fuel_levels("100") == "Percentage must be a number"
  end

  test "Returns 'empty tank' when given 0 as the argument" do
    assert ControlFlow.check_fuel_levels(0) == "empty tank"
  end

  test "Returns :ok when 200 is given as the argument" do
    assert ControlFlow.error_code_check(200) == :ok
  end

  test "Returns :unkonwn when 404 is given as the argument" do
    assert ControlFlow.error_code_check(404) == :error
  end

  test "Returns :no_content when 204 is given as the argument" do
    assert ControlFlow.error_code_check(204) == :no_content
  end

  test "Returns :unknown when '500' is given as the argument" do
    assert ControlFlow.error_code_check('500') == :unknown
  end

  test "Returns :equipment_cleared given {2, :kg, 3} as input" do
    assert ControlFlow.equipment_check({2, :kg, 3}) == :equipment_cleared
  end

  test "Returns :equipment_cleared given {2, :lbs, 3} as input" do
    assert ControlFlow.equipment_check({2, :lbs, 3}) == :equipment_cleared
  end

  test "Returns :failed given {50, :kg, 3} as input" do
    assert ControlFlow.equipment_check({50, :kg, 1}) == :failed
  end

  test "Returns 'Unit type must be either :lbs or :kg' given {2, 'kg', 3} as input" do
    assert ControlFlow.equipment_check({2, 'kg', 3}) == "Unit type must be an atom"
  end

  test "Returns 'Weight must be an integer' given {'2', :kg, 3} as input" do
    assert ControlFlow.equipment_check({'2', :kg, 3}) == "Weight must be an integer"
  end

  test "Returns 'Tuple must contain 3 arguments' given {2, :kg} as input" do
    assert ControlFlow.equipment_check({2, :kg}) == "Tuple must contain 3 arguments"
  end
end
