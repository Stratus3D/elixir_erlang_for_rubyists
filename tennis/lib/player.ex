defmodule Player do
  def start(skill, name) do
    loop(skill, name)
  end

  def loop(skill, name) do
    receive do
      {:service, opponent} ->
        send opponent, {:shot, {:ball, skill}, self, name}
        IO.puts "#{prefix(name)} Serving ball with #{skill} spin"
      {:shot, {:ball, spin}, opponent, opponent_name} ->
        case Skill.can_return_ball?(skill, spin) do
          true ->
            ball_spin = Skill.calculate_ball_spin(skill, spin)
            send opponent, {:shot, {:ball, ball_spin}, self, name}
            IO.puts "#{prefix(name)} Returned ball to #{opponent_name} with #{ball_spin} spin"

          false ->
            IO.puts "#{prefix(name)} Missed ball. #{opponent_name} wins"
        end
    end
    loop(skill, name)
  end

  def prefix(name) do
    "[#{name}]"
  end
end
