defmodule ChainLinkTest do
  use ExUnit.Case

  test "it should send all messages it receives to the pid it is passed" do
    link = spawn_link(ChainLink, :start, [self])
    msg = :echo
    send link, msg
    assert_receive ^msg
  end

  test "when it receives the :shutdown message it should end" do
    link = spawn_link(ChainLink, :start, [self])
    msg = :shutdown
    send link, msg
    assert_receive ^msg
    :false = Process.alive?(link)
  end
end
