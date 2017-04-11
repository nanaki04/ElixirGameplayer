defmodule Mock.Gamestate do
  require Logger

  def start_link(name, _game_id, _opts \\ []) do
    Logger.error("no gamestate module was passed as option to the Gameplayer.start_game function")
    Agent.start_link(fn -> %{} end, [name])
  end

end
