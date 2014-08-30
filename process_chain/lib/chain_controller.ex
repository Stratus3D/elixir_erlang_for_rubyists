defmodule ChainController do
  def start(loops, message, timed) do
    # Wait for the start message to be received
    case timed do
      true ->
        {microseconds, :ok} = :timer.tc(__MODULE__, :wait, [loops, message])
        IO.puts "#{loops} loops completed in #{microseconds / 1_000_000} seconds"
      false ->
        wait(loops, message)
    end
  end

  def wait(loops, message) do
    receive do
      {:start, first_link} ->
        # Start the first loop
        IO.puts "Sending message `#{inspect message}`!"
        send first_link, message
        loop(loops-1, message, first_link)
    end
  end

  def loop(0, message, first_link) do
    send first_link, :shutdown
    IO.puts "Got message `#{inspect message}`!"
  end

  def loop(loops, message, first_link) do
    receive do
      ^message ->
        send first_link, message
    end
    loop(loops-1, message, first_link)
  end
end
