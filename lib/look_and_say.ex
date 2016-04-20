defmodule LookAndSay do
  @doc """
    ## Examples:
    iex> LookAndSay.generate([2])
    [1, 2]
    iex> LookAndSay.generate([1, 2])
    [1, 1, 1, 2]
    iex> LookAndSay.generate([1, 1, 1, 2])
    [3, 1, 1, 2]
    iex> LookAndSay.generate([3, 1, 1, 2])
    [1, 3, 2, 1, 1, 2]
  """

  def generate(value) do
    [first | list] = value
    answer = [[first], 1]

    if Enum.any?(list) do
      answer = generate_answer(first, list)
    end

    answer_result(answer)
  end

  defp answer_result(answer) do
    [list | count] = answer

    Enum.chunk(list ++ count, 2) |> Enum.flat_map(fn(result) ->
      Enum.reverse(result)
    end)
  end

  defp generate_answer(first, list) do
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
