# Maps
%{ one: 1, two: 2, three: 3 }

# HashDicts
[one: 1, two: 2, three: 3]

# Keyword Lists allow duplicate values
[one: 1, one: "One", two: 2]

# Structs
defmodule User do
  defstruct username: "", email: "", real_name: ""
end
