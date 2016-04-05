defmodule Sequence do
  @moduledoc """
    Functional look and say implementation

    ## Examples

      iex> Sequence.calc([])
      []

      iex> Sequence.calc([1, 1])
      [2, 1]
  """

  def calc([]), do: []
  def calc([first | other]), do: calc(other, first, 1)

  defp calc([same | other], same, n), do: calc(other, same, n + 1)
  defp calc([next | other], last, n), do: [n, last | calc(other, next, 1)]
  defp calc([], last, n), do: [n, last]
end
