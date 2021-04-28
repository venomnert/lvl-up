defmodule PalindromeTest do
  use ExUnit.Case
  doctest Palindrome

  test "greets the world" do
    assert Palindrome.hello() == :world
  end
end
