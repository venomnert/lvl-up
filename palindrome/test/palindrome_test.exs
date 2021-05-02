defmodule PalindromeTest do
  use ExUnit.Case
  alias Palindrome, as: PL

  test "Test valid input" do
    assert {:ok, 1111} = PL.get_palindrome(1101)
    assert {:ok, 9999} = PL.get_palindrome(9989)
    assert {:ok, 12021} = PL.get_palindrome(11011)
    assert {:ok, 1023201} = PL.get_palindrome(1013555)
  end

  test "Test invalid input" do
    assert {:error, _} = PL.get_palindrome("11dafs")
  end

  test "even case" do
    assert {:ok, 111} = PL.get_palindrome(99)
    assert {:ok, 10001} = PL.get_palindrome(9999)
  end

  test "odd case" do

  end
end
