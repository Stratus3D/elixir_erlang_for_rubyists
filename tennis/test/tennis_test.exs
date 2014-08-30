defmodule TennisTest do
  use ExUnit.Case

  test "[start/2] should return a tuple of pids" do
    {player1, player2} = Tennis.start(0.9, 0.8)
    true = is_pid(player1)
    true = is_pid(player2)
  end

  test "[practice/0] should return the pid of the player" do
    player = Tennis.start(0.9, 0.8)
    true = is_pid(player)
  end
end
