defmodule ProcessChainTest do
  use ExUnit.Case

  test "start/3 should return ok" do
    :ok = ProcessChain.start(100, 100, :test)
  end

  test "start/3 should return ok when told to create 100000 processes" do
    :ok = ProcessChain.start(10000, 100, :test)
  end

  test "start/3 should return ok when told to loop 100000 times" do
    :ok = ProcessChain.start(100, 10000, :test)
  end
end
