defmodule ProcessChain do

  def start_timed(processes, loops, message) do
    start(processes, loops, message, true)
  end

  def start(processes, loops, message) do
    start(processes, loops, message, false)
  end

  def start(processes, loops, message, timed) do
    controller = spawn_link(ChainController, :start, [loops, message, timed])
    first_pid = create_loop(processes, controller)
    send controller, {:start, first_pid}
    :ok
  end

  def create_loop(0, previous_pid) do
    previous_pid
  end

  def create_loop(processes, previous_pid) do
    pid = spawn_link(ChainLink, :loop, [previous_pid])
    create_loop(processes - 1, pid)
  end
end
