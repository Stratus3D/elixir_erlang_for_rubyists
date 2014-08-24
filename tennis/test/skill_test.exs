defmodule SkillTest do
  use ExUnit.Case

  test "[seed/0] should always return a seed value" do
    :undefined = Skill.seed
    {_, _, _} = Skill.seed
  end

  test "[can_return_ball?/2] should always return a boolean" do
    Skill.seed
    result = Skill.can_return_ball?(0.7, 0.4)
    true = is_boolean(result)
    result = Skill.can_return_ball?(1, 0.4)
    true = is_boolean(result)
    result = Skill.can_return_ball?(0.1, 0.4)
    true = is_boolean(result)
  end

  test "[calculate_ball_spin/2]" do
    Skill.seed
    result = Skill.calculate_ball_spin(0.7, 0.4)
    assert result >= 0 and result <= 1
    result = Skill.calculate_ball_spin(1, 0.4)
    assert result >= 0 and result <= 1
    result = Skill.calculate_ball_spin(0.1, 0.4)
    assert result >= 0 and result <= 1
  end
end
