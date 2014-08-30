defmodule Player do
  def start(skill, name) when skill >= 0 and skill <=1 do
    loop(skill, name)
  end

  def loop(skill, name) do
    receive do
      {:service, opponent} ->
        send opponent, {:shot, {:ball, skill}, self, name}
        IO.puts "#{prefix(name)} Serving ball with #{skill} spin"
        loop(skill, name)
      {:shot, {:ball, spin}, opponent, opponent_name} ->
        case Skill.calculate_return(skill, spin) do
          0 ->
            IO.puts "#{prefix(name)} Missed ball. #{opponent_name} wins!!!"
          return_spin ->
            send opponent, {:shot, {:ball, return_spin}, self, name}
            IO.puts "#{prefix(name)} Returned ball to #{opponent_name} with #{return_spin} spin"
            loop(skill, name)
        end
    end
  end

  def prefix(name) do
    "[#{name}]"
  end
end
