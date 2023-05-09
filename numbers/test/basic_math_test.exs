defmodule BasicMathTest do
  use ExUnit.Case
    doctest BasicMath

    test "add 2 + 3" do
      assert BasicMath.add(2, 3) == 5
    end

    test "subtract 2 - 3" do
      assert BasicMath.subtract(2, 3) == -1
    end

    test "multiply 2 * 3" do
      assert BasicMath.multiply(2, 3) == 6
    end

    test "divide 2 / 3" do
      assert BasicMath.divide(2, 3) == 0.67
    end

    test "Round to two decimal places" do
      assert BasicMath.round_up(2.56) == 2.57
    end
end
