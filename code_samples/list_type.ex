# List
[1,2,3]

# In Elixir, just like in Erlang, the `=` denotes pattern
# matching and not an assignment. It is a "challenge"

# We can access the head and tail of a list as follows
[head|tail] = [1,2,3]
head #=> 1
tail #=> [2,3]

# Sometimes pattern matching fails
[head|tail] = []
#=> ** (MatchError) no match of right hand side value: []
