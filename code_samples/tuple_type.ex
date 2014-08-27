# Tuple
{:one, :two, :three}

# Tuples that are stored contiguously in memory
{1,2,3,4}

# We can access a tuple element with the `elem` function:
elem({1, 2, 3}, 0) #=> 1

# Tuples can be pattern matched
{:a, second, third} = {:a, :b, :c}
second #=> :b
third #=> :c
