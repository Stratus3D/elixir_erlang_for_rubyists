defmodule Skill do
  def seed() do
    {s1, s2, s3} = :os.timestamp()
    :random.seed({s1, s2, s3})
  end

  def calculate_return(skill, spin) do
    seed
    rand = randomness
    #IO.puts "Randomness #{rand}"
    case skill + (rand - spin) do
      num when num >= 0 and num <= 1 ->
        Float.round(num, 3)
      num when num > 1 ->
        1
      num when num < 0 ->
        0
    end
  end

  def randomness do
    (:random.uniform - 0.4) * 1.7
  end
end
