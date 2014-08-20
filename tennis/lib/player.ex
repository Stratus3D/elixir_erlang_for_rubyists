defmodule Player do
  def start(skill) do
    loop(skill)
  end

  def calculate_ball_spin(received_spin) do
    received_spin
  end

  def loop(skill) do
    receive do
      {:service, opponent} ->
        send opponent, {:shot, {:ball, 0.5}, self}
        IO.puts "Served ball to #{opponent}"
      {:shot, {:ball, spin}, opponent} ->
        ball_spin = calculate_ball_spin(spin)
        send opponent, {:shot, {:ball, ball_spin}, self}
        IO.puts "Returned ball to #{opponent}"
    end
    loop(skill)
  end
end
