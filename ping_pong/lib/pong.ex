defmodule Pong do
  def loop do
    receive do
      {:ping, pid} ->
        send pid, {:pong, self}
        IO.puts "Pong received a ping"
    end
    loop
  end
end
