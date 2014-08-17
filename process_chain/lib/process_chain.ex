defmodule ProcessChain do
  def start(processes, loops, message) do
    controller = spawn_link(ChainController, :start, [loops, message])
    first_pid = create_loop(processes, controller)
    send controller, {:start, first_pid}
    :ok
  end

  def create_loop(0, previous_pid) do
    previous_pid
  end

  def create_loop(processes, previous_pid) do
    pid = spawn_link(ChainLink, :start, [previous_pid])
    create_loop(processes - 1, pid)
  end
end
