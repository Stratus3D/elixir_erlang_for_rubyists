defmodule PlayerTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    player = spawn_link(Player, :start, [0.8])
    send player, {:service, self}
    assert_receive {:shot, {:ball, 0.5}, ^player}
    send ping, {:pong, self}
    assert_receive {:ping, ^player}
  end
end
