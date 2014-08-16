defmodule Ping do
  def start do
    loop
  end

  def loop do
    receive do
      {:pong, pid} ->
        send pid, {:ping, self}
        IO.puts "Ping received a pong"
    end
    loop
  end
end
