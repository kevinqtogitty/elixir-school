defmodule StringsTest do
  use ExUnit.Case
  doctest Strings

  test "Trims whitespace from a given string" do
    assert Strings.trim_string(" kevin ") == "kevin"
  end

  test "Trims whitespace from a given string & returns first char" do
    assert Strings.trim_string_get_first(" kevin ") == "k"
  end

  test "Trims whitespace from a given string & returns Capilized initial" do
    assert Strings.capitalize_initial(" kevin ") == "K. "
  end

  test "Trims whitespace from a given string & returns properly formatted initials" do
    assert Strings.capitalize_initials(" kevin to ") == "K. T."
  end


end
