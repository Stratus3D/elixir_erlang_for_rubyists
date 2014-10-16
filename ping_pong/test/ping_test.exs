defmodule PingTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    ping = spawn_link(Ping, :loop, [])
    send ping, {:pong, self}
    assert_receive {:ping, ^ping}
    send ping, {:pong, self}
    assert_receive {:ping, ^ping}
  end
end
