defmodule Palindrome do
  @moduledoc false

  def get_palindrome(input) when is_integer(input) do
    input
    |> Integer.to_string()
    |> process_input()
  end

  def get_palindrome(_), do: {:error, "Invalid input, please pass an integer"}

  def process_input(input) do
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
    |> reverse(:even)
    |> check(input)
    |> case do
      {true, new} -> {:ok, to_integer(new)}
      {false, new} -> increment(new, :even)
    end
  end

  def compute(input, :odd) do
    input
    |> reverse(:odd)
    |> check(input)
    |> case do
      {true, new} -> {:ok, to_integer(new)}
      {false, new} -> increment(new, :odd)
    end
  end

  def reverse(input, :even) do
    first_half = input |> Enum.slice(0, div(length(input), 2))
    first_half ++ Enum.reverse(first_half)
  end

  def reverse(input, :odd) do
    first_half = input |> Enum.slice(0, div(length(input), 2))
    middle = input |> Enum.at(div(length(input), 2))
    first_half ++ [middle] ++ Enum.reverse(first_half)
  end

  def check(new, old) do
    new_int = new |> to_integer()
    old_int = old |> to_integer()
    is_palindrome = new |> List.to_string() |> is_equal()
    result = new_int > old_int && is_palindrome
    {result, new}
  end

  def increment(input, :even) do
    increment_by = input |> length() |> div(2)
    input_int = input |> to_integer()

    (input_int + :math.pow(10, increment_by))
    |> trunc()
    |> Integer.to_string()
    |> process_input()
  end

  def increment(input, :odd) do
    increment_by = input |> length() |> div(2) |> Kernel.+(1)
    input_int = input |> to_integer()

    (input_int + :math.pow(10, increment_by))
    |> trunc()
    |> Integer.to_string()
    |> process_input()
  end

  defp to_integer(input) when is_list(input) do
    input
    |> List.to_string()
    |> String.to_integer()
  end

  defp is_equal(input) do
    input
    |> String.reverse()
    |> String.equivalent?(input)
  end
end
