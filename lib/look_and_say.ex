defmodule LookAndSay do
  @doc """
    ## Examples:
    iex> LookAndSay.calc([2])
    [1, 2]
    iex> LookAndSay.calc([1, 2])
    [1, 1, 1, 2]
    iex> LookAndSay.calc([1, 1, 1, 2])
    [3, 1, 1, 2]
    iex> LookAndSay.calc([3, 1, 1, 2])
    [1, 3, 2, 1, 1, 2]
  """

  def calc(list) do
    if Enum.any?(list) do
      normalize(next(list))
    else
      []
    end
  end

  defp normalize(answer) do
    [list | count] = answer

    Enum.chunk(list ++ count, 2) |> Enum.flat_map(fn(result) ->
      Enum.reverse(result)
    end)
  end

  defp next(value) do
    [first | list] = value

    Enum.reduce(list, [[first], 1], fn(number, result) ->
      [current | count] = result

      if number === List.last(current) do
        [current, List.first(count) + 1]
      else
        [current ++ count ++ [number], 1]
      end
    end)
  end
end
