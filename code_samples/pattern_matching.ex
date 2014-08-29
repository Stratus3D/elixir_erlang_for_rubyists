# In Elixir, just like in Erlang, the `=` denotes pattern matching
:a = :a
#=> :a
:a = :b
#=> ** (MatchError) no match of right hand side value: :b

# Atoms can be used in pattern matching
{:ok, foo} = {:ok, "foo bar baz"}
foo #=> 2

{:ok, foo} = {:error, :crashed}
#=> ** (MatchError) no match of right hand side value: {:error, :crashed}

# It's common practice to assign a value to `_` if we don't need it
{status, _} = {:error, :crashed}
status #=> :error

# Patter matching a list
[head|tail] = [1,2,3]
head #=> 1
tail #=> [2,3]
