defmodule Skill do
  def seed() do
    {s1, s2, s3} = :erlang.time()
    :random.seed({s1, s3, s2})
  end

  def can_return_ball?(skill, spin) do
    (skill - (spin/2 + :random.uniform/1.5)) > 0
  end

  def calculate_ball_spin(skill, spin) do
    case skill - (spin/6 + :random.uniform/3) do
      num when num >= 0 ->
        num
      num when num < 0 ->
        0
    end
  end
end
