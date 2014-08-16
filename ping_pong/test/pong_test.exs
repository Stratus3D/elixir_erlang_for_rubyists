defmodule PongTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    pong = spawn_link(Pong, :start, [])
    send pong, {:ping, self}
    assert_receive {:pong, ^pong}
    send pong, {:ping, self}
    assert_receive {:pong, ^pong}
  end
end
