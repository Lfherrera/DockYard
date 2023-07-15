defprotocol BattleMap.Character do
  def can_attack?(character, origin, target)
end

defimpl BattleMap.Character, for: BattleMap.Barbarian do
  def can_attack?(_character, {player_x, player_y}, {x, y}) do
    diff_x = player_x - x
    diff_y = player_y - y

    abs(diff_x) <= 2 && abs(diff_y) <= 2
  end
end

defimpl BattleMap.Character, for: BattleMap.Wizard do
  def can_attack?(_character, {init_x, init_y}, {x, y}) do
    x_diff = init_x - x
    y_diff = init_y - y

    init_x == x || init_y == y || abs(x_diff) == abs(y_diff)
  end
end
