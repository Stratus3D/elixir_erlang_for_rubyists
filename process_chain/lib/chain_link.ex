defmodule ChainLink do
  def loop(next_pid) do
    receive do
      :shutdown ->
        send next_pid, :shutdown
        msg ->
          send next_pid, msg
          loop(next_pid)
    end
  end
end
