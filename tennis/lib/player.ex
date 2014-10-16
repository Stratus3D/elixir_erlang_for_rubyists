defmodule Player do
  def loop(skill, name) when skill >= 0 and skill <=1 do
    receive do
      {:service, opponent} ->
        Process.send_after opponent, {:shot, {:ball, skill}, self, name}, 500
        IO.puts "#{prefix(name)} Serving ball with #{skill} spin"
        loop(skill, name)
      {:shot, {:ball, spin}, opponent, opponent_name} ->
        case Skill.calculate_return(skill, spin) do
          0 ->
            Process.send_after opponent, {:over, self, name}, 500
            IO.puts "#{prefix(name)} Missed ball"
          return_spin ->
            Process.send_after opponent, {:shot, {:ball, return_spin}, self, name}, 500
            IO.puts "#{prefix(name)} Returned ball to #{opponent_name} with #{return_spin} spin"
            loop(skill, name)
        end
      {:over, opponent, opponent_name} ->
        IO.puts "#{prefix(name)} #{opponent_name} failed to return the ball. I win!!!"
    end
  end

  def prefix(name) do
    "[#{name}]"
  end
end
