defmodule ChainController do
  def start(loops, message) do
    # Wait for the start message to be received
    wait(loops, message)
  end

  def wait(loops, message) do
    receive do
      {:start, first_link} ->
        # Start the first loop
        IO.puts "Sending message `#{message}`!"
        send first_link, message
        loop(loops-1, message, first_link)
    end
  end

  def loop(0, message, first_link) do
    send first_link, :shutdown
    IO.puts "Got message `#{message}`!"
  end

  def loop(loops, message, first_link) do
    receive do
      ^message ->
        send first_link, message
    end
    loop(loops-1, message, first_link)
  end
end
