defmodule PlayerTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    player_name = "Test Player"
    player = spawn_link(Player, :loop, [0.8, player_name])
    send player, {:service, self}
    assert_receive {:shot, {:ball, 0.8}, ^player, ^player_name}
    send player, {:shot, {:ball, 0.4}, self}
  end
end
