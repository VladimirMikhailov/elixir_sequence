defmodule SequenceTest do
  use ExUnit.Case
  doctest Sequence

  test "returns blank list for blank" do
    assert Sequence.calc([]) == []
  end

  test "returns look and say sequence" do
    assert Sequence.calc([1, 2, 2, 4, 5, 5, 5]) == [1, 1, 2, 2, 1, 4, 3, 5]
  end
end
