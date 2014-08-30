defmodule SkillTest do
  use ExUnit.Case

  test "[seed/0] should always return a seed value" do
    :undefined = Skill.seed
    {_, _, _} = Skill.seed
  end

  test "[calculate_return/2]" do
    Skill.seed
    result = Skill.calculate_return(0.7, 0.4)
    assert result >= 0 and result <= 1
    result = Skill.calculate_return(1, 0.4)
    assert result >= 0 and result <= 1
    result = Skill.calculate_return(0.1, 0.4)
    assert result >= 0 and result <= 1
  end
end
