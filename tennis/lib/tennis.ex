defmodule Tennis do
  @moduledoc """
  """

  @doc """
  spawn two players, and gives one the ball to start the match
  """
  def start(skill1, skill2) do
    player1 = spawn_link(Player, :start, [skill1, "Player 1"])
    player2 = spawn_link(Player, :start, [skill2, "Player 2"])
    send player1, {:service, player2}
    {player1, player2}
  end

  @doc """
  """
  def practice do
    player = spawn_link(Player, :start, [0.7, "Player"])
    shot = {:shot, {:ball, 0.1}, self, "Coach"}
    send player, shot
    send player, shot
    send player, shot
    player
  end
end
