defmodule Tennis do
  @moduledoc """
  """

  @doc """
  spawn two players, and gives one the ball to start the match
  """
  def start do
    player1 = spawn_link(Player, :start, [])
    player2 = spawn_link(Player, :start, [])
    send player1, {:service, {:ball, 0}}
  end

  @doc """
  """
  def practice do
    player = spawn_link(Pong, :start, [])
    shot = {:shot, {:ball, 0.1}, self}
    send player, shot
    send player, shot
    send player, shot
  end
end
