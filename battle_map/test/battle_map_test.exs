defmodule BattleMapTest do
  use ExUnit.Case
  alias BattleMap.Barbarian
  alias BattleMap.Wizard

  # You May Use The Following Test Suite To Validate Your Solution.
  ExUnit.start(auto_run: false)

  defmodule BarbarianTests do
    use ExUnit.Case

    describe "Barbarian" do
      test "can attack within two squares of current position" do
        for x <- 2..6, y <- 2..6 do
          assert Character.can_attack?(%Barbarian{}, {4, 4}, {x, y})
        end
      end

      test "cannot attack beyond two squares of current position" do
        refute Character.can_attack?(%Barbarian{}, {4, 4}, {1, 1})
        refute Character.can_attack?(%Barbarian{}, {4, 4}, {7, 7})
        refute Character.can_attack?(%Barbarian{}, {4, 4}, {7, 1})
        refute Character.can_attack?(%Barbarian{}, {4, 4}, {1, 7})
      end

      test "logic is not hardcoded to the {4, 4} position" do
        refute Character.can_attack?(%Barbarian{}, {3, 3}, {6, 6})
      end
    end
  end

  # You May Use The Following Test Suite To Validate Your Solution.
ExUnit.start(auto_run: false)

defmodule WizardTests do
  use ExUnit.Case

  describe "Wizard" do
    test "can attack in eight directions" do
      # up, up-right, right, down-right, down, down-left, left, up-left
      assert Character.can_attack?(%Wizard{}, {4, 4}, {4, 5})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {5, 5})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {5, 4})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {5, 3})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {4, 3})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {3, 3})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {3, 4})
      assert Character.can_attack?(%Wizard{}, {4, 4}, {3, 5})
    end

    test "cannot attack invalid squares" do
      refute Character.can_attack?(%Wizard{}, {4, 4}, {6, 5})
      refute Character.can_attack?(%Wizard{}, {4, 4}, {2, 5})
      refute Character.can_attack?(%Wizard{}, {4, 4}, {3, 2})
      refute Character.can_attack?(%Wizard{}, {4, 4}, {6, 3})
    end
  end
end

ExUnit.run()
end
