defmodule ChainController do
  def start(loops, message, first_link) do
    # Wait for the first loop to complete and send repeat loop
    loop(loops, message, first_link)
  end

  def loop(0, message, first_link) do
    send first_link, :shutdown
    IO.puts "Got message `#{message}`!"
  end

  def loop(loops, message, first_link) do
    receive do
      :start ->
        # Start the first loop
        IO.puts "Sending message `#{message}`!"
        send first_link, message
      ^message ->
        send first_link, message
    end
    loop(loops-1, message, first_link)
  end
end
