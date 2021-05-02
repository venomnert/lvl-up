# lvl-up

# Setup
1. Ensure you have the `elixir 1.10` or greater and `erlang 23.0` installed on your system
2. Go into a problem set folder
3. Ensure there is a `mix.exs` file and then run the following commands:
    1. `mix deps.get` - This will fetch an projec dependencies
    2. `mix test` - This will run the test.

# Problem Set
## Next Larger Palindrome
Next Larger Palindrome goes like this:
You are given a number, and you need to find the next larger palindrome.

```
1234063 => 1234321
1234539 => 1235321
1239539 => 1240421
9999 => 10001
```

## Does a Continuation Exist?
We are given a 2d matrix, for example

```
a n c n e
a e e r e
a b c t e
a g i h e
a n c d e
```

and a string, for example `neerthigan`.

We need to write a function and return a boolean to see if this string can be found as a continuation in the matrix. By continuation, we mean precisely this:
1. If you find the first character of the string in the cell (x, y) in the matrix,
2. And find the next character at one of the neighbors (maximum of 8 possible) of that cell,
3. And so on, till you reach the end of the string.
The neighbors of a cell, which can be a maximum of 8 (no wrapping allowed) are at positions up and down, left and right, and 4 positions diagonally relative to that cell.
In the example given above, a continuation does exist, as shown here, so the function will return true!

![[./lvl-up/image.png]]
