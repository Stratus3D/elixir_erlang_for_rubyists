defmodule PingPong do
  @moduledoc """
  For experimenting with Ping and Pong modules
  """

  @doc """
  spawn a ping and a pong, and have them send messages back and forth
  """
  def start do
    ping = spawn_link(Ping, :start, [])
    pong = spawn_link(Pong, :start, [])
    send ping, {:pong, pong}
  end

  @doc """
  Spawns a Pong process and then sends three pings
  """
  def send_pings do
    pong = spawn_link(Pong, :start, [])
    send pong, {:ping, self}
    send pong, {:ping, self}
    send pong, {:ping, self}
  end
end
