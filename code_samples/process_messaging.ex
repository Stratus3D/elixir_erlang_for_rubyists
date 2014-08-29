# `pid` is a process
message = {:add, 1, 2}
send pid, message

# Listen for messages
receive do
  {:add, x, y} ->
    x + y
  {:subtract, x, y} ->
    x - y
  _ ->
    :error
end
