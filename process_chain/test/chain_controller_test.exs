defmodule ChainControllerTest do
  use ExUnit.Case

  test "should loop the given number of times (two in this case)" do
    # Spawn controller process
    msg = :test
    controller = spawn(ChainController, :start, [2, msg])
    send controller, {:start, self}

    # Start loop
    send controller, :start

    # Should send message on first loop
    assert_receive ^msg
    send controller, msg
    # Should send message on second loop
    assert_receive ^msg
    send controller, msg

    # Should not send message on third loop
    refute_receive ^msg

    # Should send shutdown message to processes in the loop when finished
    assert_receive :shutdown
  end
end
