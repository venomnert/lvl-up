defmodule Palindrome do
  @moduledoc false

  # TODO test for valid false input
  def get_palindrome(input) when is_integer(input) do
    input
    |> Integer.to_string()
    |> get_palindrome()
  end

  def get_palindrome(input) when is_binary(input) do
    input
    |> IO.inspect(label: "RESI")
    |> String.length()
    |> rem(2)
    |> case do
      0 ->
        input
        |> String.graphemes()
        |> compute(:even)

      1 ->
        input
        |> String.graphemes()
        |> compute(:odd)
    end
  end

  def compute(input, :even) do
    input
    |> reverse()
    |> check(input)
    |> case do
      {true, new} -> to_integer(new)
      {false, new} -> increment(new, :even)
    end
  end

  def reverse(input) do
    first_half = input |> Enum.slice(0, div(length(input), 2))
    first_half ++ Enum.reverse(first_half)
  end

  def check(new, old) do
    new_int = new |> to_integer()
    old_int = old |> to_integer()
    is_palindrome = new |> List.to_string() |> String.reverse() |> String.equivalent?(new)
    result = new_int > old_int && is_palindrome
    {result, new}
  end

  # TODO very 99 is an edge to test
  def increment(input, :even) do
    increment_by = input |> length() |> div(2)
    input_int = input |> to_integer()

    (input_int + :math.pow(10, increment_by))
    |> trunc()
    |> Integer.to_string()
    |> get_palindrome()
  end

  defp to_integer(input) when is_list(input) do
    input
    |> List.to_string()
    |> String.to_integer()
  end
end
